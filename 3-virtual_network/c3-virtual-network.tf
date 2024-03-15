resource "azurerm_network_security_group" "nsg-myspace-run" {
  name                = "nsg-myspace-run"
  location            = azurerm_resource_group.rg-myspace-run.location
  resource_group_name = azurerm_resource_group.rg-myspace-run.name
}

resource "azurerm_virtual_network" "vnet-myspace-run" {
  name                = "example-network"
  location            = azurerm_resource_group.rg-myspace-run.location
  resource_group_name = azurerm_resource_group.rg-myspace-run.name
  address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet-workload"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet-connecction"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg-myspace-run.id
  }

  tags = {
    environment = "Production"
  }
}