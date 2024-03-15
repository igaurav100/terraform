# Azure virtual network 
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  address_space = [ "10.0.0.0/16" ]
}

#Subnet
resource "azurerm_subnet" "mysubnet" {
  name = "mysubnet"
  resource_group_name = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes = [ "10.0.2.0/24" ]
}

#Creating public IP 
resource "azurerm_public_ip" "mypublicip" {
  name = "mypublicip"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  allocation_method = "Static"

}

# Creating network interface
resource "azurerm_network_interface" "mynic" {
  name = "mynic"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name = "Internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}