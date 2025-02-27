variable "vm_prefix" {
  description = "Specifies the prefix added to the names of all VMs. Default is 'demo-tf'."
  type        = string
  default     = "demo-tf"
}

variable "vm_count" {
  description = "Specifies the number of VM instances to be created. Default is '1'."
  type        = number
  default     = 1
}

variable "vm_namespace" {
  description = "Specifies the namespace where the VMs will be created. Default is 'default'."
  type        = string
  default     = "default"
}

variable "ssh_username" {
  description = "Specifies the username used for SSH login. Default is 'ubuntu'."
  type        = string
  default     = "ubuntu"
}

variable "ssh_password" {
  description = "Specifies the password used for SSH login. Default is 'null'."
  type        = string
  default     = null
}

variable "cpu" {
  description = "Specifies the number of CPU cores allocated to each VM. Default is '2'."
  type        = number
  default     = 2
}

variable "memory" {
  description = "Specifies the amount of memory allocated to each VM, in GB. Default is '4'."
  type        = number
  default     = 4
}

variable "network_name" {
  description = "Specifies the name of the Harvester VM network that was created. Default is an empty string ('')." # management network by default
  type        = string
  default     = ""
}

variable "image_namespace" {
  description = "Specifies the namespace in which the Harvester image was created. Default is 'default'."
  type        = string
  default     = "default"
}

variable "image_name" {
  description = "Specifies the OS image name. Default is 'ubuntu22'."
  type        = string
  default     = "ubuntu22"
}

variable "os_disk_size" {
  description = "Specifies the size of the root disk attached to each VM, in GB. Default is '25'."
  type        = number
  default     = 25
}

variable "data_disk_size" {
  description = "Specifies the size of the data disk attached to each VM, in GB. Default is '25'."
  type        = number
  default     = 25
}

variable "startup_script" {
  description = "Specifies a custom startup script to be executed when the VM is initialized. Default is 'null'."
  type        = string
  default     = null
}

variable "harvester_url" {
  description = "Specifies the URL of the Harvester cluster API."
  type        = string
}

variable "kubeconfig_file_path" {
  description = "Specifies the full path where the Kubeconfig file is located."
  type        = string
}

variable "kubeconfig_file_name" {
  description = "Specifies the name of the Kubeconfig file used to access the Harvester cluster."
  type        = string
}
