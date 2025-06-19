provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracct123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = ["0.0.0.0"] # Replace with your IP or make a variable
  }

  tags = {
    environment = "demo"
  }
}
