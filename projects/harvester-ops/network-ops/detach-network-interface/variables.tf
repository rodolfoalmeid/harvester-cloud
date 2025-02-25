variable "network_name" {
  description = "Specifies the name of the Harvester VM network. Default is 'vlan2'."
  type        = string
  default     = "vlan2"
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

variable "private_ssh_key_file_path" {
  description = "Specifies the full path where the private SSH key file is located."
  type        = string
}

variable "private_ssh_key_file_name" {
  description = "Specifies the name of the private SSH key file used for authentication."
  type        = string
}
