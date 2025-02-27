module "harvester_vm" {
  source          = "../../../modules/harvester/virtual-machine"
  vm_prefix       = var.vm_prefix
  vm_count        = var.vm_count
  vm_namespace    = var.vm_namespace
  ssh_username    = var.ssh_username
  ssh_password    = var.ssh_password
  cpu             = var.cpu
  memory          = var.memory
  image_namespace = var.image_namespace
  image_name      = var.os_image_name
  os_disk_size    = var.os_disk_size
  data_disk_size  = var.data_disk_size
  startup_script  = var.startup_script
}
