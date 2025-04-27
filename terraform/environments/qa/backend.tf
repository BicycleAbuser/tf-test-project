terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstate22893"
    container_name       = "tfstate"
    key                  = "qa.terraform.tfstate"   # For QA
  }
}
