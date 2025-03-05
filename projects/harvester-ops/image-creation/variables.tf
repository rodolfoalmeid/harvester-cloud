variable "create_image" {
  description = "Specifies whether a Harvester VM image should be created. Default is 'true'."
  type        = bool
  default     = true
}

variable "image_name" {
  description = "Specifies the name of the Harvester image to be created. Default is 'ubuntu22'."
  type        = string
  default     = "ubuntu22"
}

variable "image_namespace" {
  description = "Specifies the namespace in which the Harvester image will be created. Default is 'default'."
  type        = string
  default     = "default"
}

variable "image_source_type" {
  description = "Specifies the source type for the Harvester image. Default is 'download'."
  type        = string
  default     = "download"
}

variable "image_url" {
  description = "Specifies the URL used to download the Harvester image. Default is 'https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img'."
  type        = string
  default     = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
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
