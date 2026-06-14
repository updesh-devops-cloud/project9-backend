terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.77"
    }
  }

  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "tfstateup1234567890"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}