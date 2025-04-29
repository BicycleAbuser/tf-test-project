provider "azurerm" {
  features {}
 
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Define the resource group for the qa environment
resource "azurerm_resource_group" "qa_rg" {
  name     = "terraform-project-qa-rg"
  location = var.location
}

module "key_vault" {
  source              = "../../modules/key-vault"
  key_vault_name       = var.key_vault_name
  resource_group_name  = azurerm_resource_group.qa_rg.name
  location             = var.location
  tenant_id            = var.tenant_id
}
