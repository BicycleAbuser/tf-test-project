provider "azurerm" {
  features {}
}

module "storage_account" {
  source              = "../../modules/storage_account"
  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location
}
