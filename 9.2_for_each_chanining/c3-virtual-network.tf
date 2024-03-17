# Creating virtual network 
resource "azurerm_virtual_network" "vnet-uksdata-dev" {
  name = "vnet-uks-data-dev"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg-uks-data-dev.location
  resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
}

#Creating the subnet
resource "azurerm_subnet" "subnet-connection" {
  name = "subnet-connection"
  address_prefixes = [ "10.0.2.0/24" ]
  virtual_network_name = azurerm_virtual_network.vnet-uksdata-dev.name
  resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
}

# Create Azure Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  for_each = toset(["vm1", "vm2"])
  name = "mypublicip-${each.key}"
  resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
  location = azurerm_resource_group.rg-uks-data-dev.location
  allocation_method = "Static"
}

#Creating network interface 
resource "azurerm_network_interface" "myvmnic" {
    for_each = azurerm_public_ip.mypublicip
    # for_each = toset(["vm1", "vm2"])
    name = "vmnic-${each.key}"
    location = azurerm_resource_group.rg-uks-data-dev.location
    resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.subnet-connection.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.mypublicip[each.key].id
    }
  
}
