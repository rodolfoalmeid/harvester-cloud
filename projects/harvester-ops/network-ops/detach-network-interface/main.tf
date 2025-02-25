locals {
  harvester_public_ip = replace(replace(var.harvester_url, "https://", ""), "/$", "")
  ssh_username        = "sles"
}

resource "null_resource" "detach_and_reboot_nodes" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    connection {
      host        = local.harvester_public_ip
      user        = local.ssh_username
      private_key = file("${var.private_ssh_key_file_path}/${var.private_ssh_key_file_name}")
    }
    inline = [
      <<-EOT
        NODE_COUNT=$(sudo virsh list --all | grep -c "running")
        for i in $(seq 1 $NODE_COUNT); do
          MAC_ADDRESS=$(sudo virsh domiflist harvester-node-$i | grep virbr2 | awk '{print $5}')
          if [ -n "$MAC_ADDRESS" ]; then
            echo "Detaching interface with MAC $MAC_ADDRESS from harvester-node-$i."
            sudo virsh detach-interface --domain harvester-node-$i --type bridge --mac $MAC_ADDRESS --config --live
          fi
        done
        for i in $(seq 1 $NODE_COUNT); do
          echo "Rebooting harvester-node-$i"
          sudo virsh reboot harvester-node-$i
          echo "Node harvester-node-$i rebooted, waiting for it to come back online..."
          TIMEOUT=300
          TIMER=0
          until sudo virsh list --all | grep "harvester-node-$i" | grep -q "running"; do
            echo "Waiting for harvester-node-$i to restart..."
            sleep 10
            TIMER=$((TIMER+10))
            if [ "$TIMER" -ge "$TIMEOUT" ]; then
              echo "Error: harvester-node-$i did not come back online within $TIMEOUT seconds."
              exit 1
            fi
          done
          echo "harvester-node-$i is back online."
        done
        echo "Destroying and undefining the network ${var.network_name}"
        sudo virsh net-destroy --network "${var.network_name}" || true
        sudo virsh net-undefine --network "${var.network_name}" || true
      EOT
    ]
  }
}

resource "null_resource" "wait_harvester_services_startup" {
  depends_on = [null_resource.detach_and_reboot_nodes]
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
