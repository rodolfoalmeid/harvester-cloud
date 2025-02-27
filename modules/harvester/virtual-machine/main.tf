resource "random_string" "random" {
  length  = 4
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "harvester_virtualmachine" "default" {
  count                = var.vm_count
  name                 = "${var.vm_prefix}-vm-${count.index + 1}-${random_string.random.result}"
  namespace            = var.vm_namespace
  restart_after_update = true
  tags = {
    ssh-user = var.ssh_username
  }
  cpu             = var.cpu
  memory          = "${var.memory}Gi"
  efi             = true
  secure_boot     = true
  run_strategy    = "RerunOnFailure"
  hostname        = "${var.vm_prefix}-vm-${count.index + 1}-${random_string.random.result}"
  reserved_memory = "256Mi"
  machine_type    = "q35"
  network_interface {
    name           = "nic-1"
    network_name   = var.network_name
    type           = "bridge" #https://groups.google.com/g/kubevirt-dev/c/HyMWzPQGBoM
    wait_for_lease = true
  }
  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "${var.os_disk_size}Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "${var.image_namespace}/${var.image_name}"
    auto_delete = true
  }
  disk {
    name        = "emptydisk"
    type        = "disk"
    size        = "${var.data_disk_size}Gi"
    bus         = "virtio"
    auto_delete = true
  }
  cloudinit {
    user_data_base64 = var.startup_script
  }
}
