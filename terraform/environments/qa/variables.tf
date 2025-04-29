variable "key_vault_name" {
  type = string
  default = "tf-key-vault-qa" 
}

variable "resource_group_name" {
  type = string
  default = "terraform-project-qa-rg"  # Resource group name for QA environment
}

variable "location" {
  type = string
  default = "eastus"  # Location for the resources
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
  sensitive = true  # Mark as sensitive to avoid logging the value
}
variable "subscription_id" {
  type = string
}
