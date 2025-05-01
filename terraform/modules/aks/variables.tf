variable "aks_cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "The location of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "aks_node_count" {
  type        = number
  description = "The number of nodes in the default node pool"
  default     = 2
}

variable "aks_node_vm_size" {
  type        = string
  description = "The size of the VMs in the default node pool"
  default     = "Standard_B2s"
}

variable "aks_network_plugin" {
  type        = string
  description = "The network plugin to use for the AKS cluster"
  default     = "azure"
}

variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges authorized to access the AKS API server"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the AKS cluster"
  default     = {}
}