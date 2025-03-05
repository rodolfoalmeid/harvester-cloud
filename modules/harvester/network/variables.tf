variable "create_cluster_network" {
  description = "Specifies whether a Harvester Cluster Network should be created. Default is 'true'."
  type        = bool
  default     = true
}

variable "cluster_network_name" {
  description = "Specifies the name of the Harvester Cluster Network. Default is 'cluster-vlan'."
  type        = string
  default     = "cluster-vlan"
}

variable "cluster_network_vlanconfig_name" {
  description = "Specifies the name of the VLAN configuration for the Harvester Cluster Network. Default is 'cluster-vlan-all-nodes'."
  type        = string
  default     = "cluster-vlan-all-nodes"
}

variable "cluster_network_vlan_nics" {
  description = "Specifies the list of NICs used for the Harvester Cluster Network VLAN. Default is '[\"virbr2\"]'."
  type        = list(any)
  default     = ["virbr2"]
}

variable "cluster_network_vlan_bond_mode" {
  description = "Specifies the bond mode for the Harvester Cluster Network VLAN. Default is 'active-backup'."
  type        = string
  default     = "active-backup"
}

variable "network_name" {
  description = "Specifies the name of the Harvester VM network. Default is 'vlan2'."
  type        = string
  default     = "vlan2"
}

variable "network_namespace" {
  description = "Specifies the namespace where the Harvester VM network is created. Default is 'default'."
  type        = string
  default     = "default"
}

variable "network_vlan_id" {
  description = "Specifies the VLAN ID for the Harvester VM network. Default is '1'."
  type        = number
  default     = 1
}

variable "network_route_mode" {
  description = "Specifies the routing mode for the Harvester VM network. Default is 'auto'."
  type        = string
  default     = "auto"
}

variable "network_route_dhcp_server_ip" {
  description = "Specifies the DHCP server IP address for the network route. Default is an empty string ('')."
  type        = string
  default     = ""
}
