# Create virtual network
resource "azurerm_virtual_network" "vnet-mydata-dev" {
  name                = "myvnet-1"
#   name = "myvnet-2"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-uks-data-dev.location
  resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
  lifecycle {
    prevent_destroy = true
  }
}

