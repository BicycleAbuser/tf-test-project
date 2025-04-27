provider "azurerm" {
  features {}
}

module "key_vault" {
  source              = "../../modules/key_vault"
  key_vault_name       = var.key_vault_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  tenant_id            = var.tenant_id
}
