terraform {
  required_providers{
      azurerm={
          version="2.84.0"
          source="hashicorp/azurerm"
      }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}

data "azurerm_resource_group" "example" {
    name = "deepa"
    # location = "eastus"
  
}
resource "azurerm_public_ip" "main" {
    name = "javawebapp-ip"
    location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
    allocation_method = "Static"
    sku = "Basic"
}
