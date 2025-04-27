terraform {
  backend "azurerm" {
    resource_group_name  = "your-tfstate-rg"
    storage_account_name = "yourtfstateaccount"
    container_name       = "tfstate"
    key                  = "qa.terraform.tfstate"   # For QA
  }
}
