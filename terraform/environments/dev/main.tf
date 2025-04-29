provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Define the resource group for the dev environment
resource "azurerm_resource_group" "dev_rg" {
  name     = "terraform-project-dev-rg"
  location = var.location
}

# Deploy the storage account in the dev resource group
module "storage_account" {
  source               = "../../modules/storage-account"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.dev_rg.name
  location             = var.location
}
