locals {
  harvester_public_ip              = replace(replace(var.harvester_url, "https://", ""), "/$", "")
  qemu_vlanx_xml_template_file     = "../../../../modules/harvester/deployment-script/qemu_vlanx_xml.tpl"
  qemu_vlanx_xml_file              = "${path.cwd}/vlanx.xml"
  vlanx_ip_base                    = "192.168.123" # address=192.168.123.1 netmask=255.255.255.0 start=192.168.123.2 end=192.168.123.254
  harvester_network_interface_name = ["ens7"]      # Name of the NIC that is automatically created in Harvester nested VMs
  ssh_username                     = "sles"
}

resource "local_file" "qemu_vlanx_config" {
  content = templatefile("${local.qemu_vlanx_xml_template_file}", {
    name    = var.network_name,
    nic     = join(",", var.cluster_network_vlan_nics),
    ip_base = local.vlanx_ip_base
  })
  file_permission = "0644"
  filename        = local.qemu_vlanx_xml_file
}

resource "null_resource" "copy_qemu_vlanx_xml_file_to_first_node" {
  depends_on = [local_file.qemu_vlanx_config]
  connection {
    type        = "ssh"
    host        = local.harvester_public_ip
    user        = local.ssh_username
    private_key = file("${var.private_ssh_key_file_path}/${var.private_ssh_key_file_name}")
  }
  provisioner "file" {
    source      = local_file.qemu_vlanx_config.filename
    destination = "/tmp/${basename(local_file.qemu_vlanx_config.filename)}"
  }
}

resource "ssh_resource" "create_vlanx" {
  depends_on  = [null_resource.copy_qemu_vlanx_xml_file_to_first_node]
  host        = local.harvester_public_ip
  user        = local.ssh_username
  private_key = file("${var.private_ssh_key_file_path}/${var.private_ssh_key_file_name}")
  commands = [
    "sudo virsh net-define /tmp/${basename(local.qemu_vlanx_xml_file)}",
    "sudo virsh net-start ${var.network_name}",
    "sudo virsh net-autostart ${var.network_name}"
  ]
}

resource "ssh_resource" "attach_network_interface" {
  depends_on  = [ssh_resource.create_vlanx]
  host        = local.harvester_public_ip
  user        = local.ssh_username
  private_key = file("${var.private_ssh_key_file_path}/${var.private_ssh_key_file_name}")
  commands = [
    <<-EOT
      NODE_COUNT=$(sudo virsh list --all | grep -c "running")
      for i in $(seq 1 $NODE_COUNT); do
        sudo virsh attach-interface --domain harvester-node-$i --type bridge --source ${join(",", var.cluster_network_vlan_nics)} --model virtio --config --live
      done
      for i in $(seq 1 $NODE_COUNT); do
        sudo virsh reboot harvester-node-$i
      done
    EOT
  ]
}

resource "null_resource" "wait_harvester_services_startup" {
  depends_on = [ssh_resource.attach_network_interface]
  provisioner "local-exec" {
    command     = <<-EOF
      count=0
      while [ "$${count}" -lt 15 ]; do
        resp=$(curl -k -s -o /dev/null -w "%%{http_code}" $${HARVESTER_URL}/ping)
        echo "Waiting for $${HARVESTER_URL}/ping - response: $${resp}"
        if [ "$${resp}" = "200" ]; then
          ((count++))
        fi
        sleep 2
      done
      EOF
    interpreter = ["/bin/bash", "-c"]
    environment = {
      HARVESTER_URL = var.harvester_url
    }
  }
}

module "harvester_network" {
  depends_on                      = [ssh_resource.attach_network_interface]
  source                          = "../../../../modules/harvester/network"
  cluster_network_name            = var.cluster_network_name
  cluster_network_vlanconfig_name = var.cluster_network_vlanconfig_name
  cluster_network_vlan_nics       = local.harvester_network_interface_name
  cluster_network_vlan_bond_mode  = var.cluster_network_vlan_bond_mode
  network_name                    = var.network_name
  network_namespace               = var.network_namespace
  network_vlan_id                 = var.network_vlan_id
  network_route_mode              = var.network_route_mode
  network_route_dhcp_server_ip    = var.network_route_dhcp_server_ip
}
