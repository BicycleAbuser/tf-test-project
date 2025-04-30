# General variables
variable "storage_account_name" {
  type    = string
  default = "tfdev22893" # Storage account name for dev environment
}

variable "resource_group_name" {
  type    = string
  default = "terraform-project-dev-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

# Azure credentials
variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

# AKS variables
variable "enable_aks" {
  type    = bool
  default = false
}

variable "aks_cluster_name" {
  type    = string
  default = "dev-aks-cluster"
}

variable "aks_node_count" {
  type    = number
  default = 2
}

variable "aks_node_vm_size" {
  type        = string
  description = "The size of the VMs in the default node pool"
  default     = "Standard_B2s" 
}

variable "aks_network_plugin" {
  type    = string
  default = "azure"
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
