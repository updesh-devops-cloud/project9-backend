provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "backend-rg"
  location = "Central India"
}
resource "azurerm_resource_group" "rg" {
  name     = "project9-rg"
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
# Naya Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "project9-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Us VNet ke andar ek Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
