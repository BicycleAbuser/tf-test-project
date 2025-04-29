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
