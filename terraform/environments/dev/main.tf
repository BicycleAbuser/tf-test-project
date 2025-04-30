provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Define the resource group for the dev environment
resource "azurerm_resource_group" "dev_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Deploy the storage account in the dev resource group
module "storage_account" {
  source               = "../../modules/storage-account"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.dev_rg.name
  location             = var.location
}

# Deploy the AKS cluster in the dev resource group (optional)
module "aks" {
  source                  = "../../modules/aks"
  count = var.enable_aks ? 1 : 0 # Only create if enable_aks is true
  aks_cluster_name        = "dev-aks-cluster"
  location                = var.location
  resource_group_name     = azurerm_resource_group.dev_rg.name
  aks_node_count          = 2
  aks_node_vm_size        = "Standard_B2s"
  aks_network_plugin      = "azure"
  api_server_authorized_ip_ranges = ["203.0.113.0/24"] # Replace with your IP range
  tags = {
    environment = "dev"
  }
}