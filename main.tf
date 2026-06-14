provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "backend-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "tfstateup1234567890"
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.backend_sa.id
  container_access_type = "private"
}