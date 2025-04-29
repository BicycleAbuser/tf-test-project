provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


module "key_vault" {
  source              = "../../modules/key-vault"
  key_vault_name       = var.key_vault_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  tenant_id            = var.tenant_id
}
