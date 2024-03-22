# Create virtual network
resource "azurerm_virtual_network" "vnet-uk-dev" {
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-uk-run.location
  resource_group_name = azurerm_resource_group.rg-uk-run.name
  name                = var.virtual_network_name
}