#Creating VNET
resource "azurerm_virtual_network" "vnet-data-run" {
  name = "vnet-data-run"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg-data-run.location
  resource_group_name = azurerm_resource_group.rg-data-run.name
  tags = {
    "name" = "vnet-date-run"
    "env"   = "dev"
  }
}

#Creating SUBNET 
resource "azurerm_subnet" "subnet-data-run" {
  name = "subnet-data-run"
  resource_group_name = azurerm_resource_group.rg-data-run.name
  virtual_network_name = azurerm_virtual_network.vnet-data-run.name
  address_prefixes = [ "10.0.2.0/24" ]

}

# Creating public ip 
resource "azurerm_public_ip" "data-vm-public-ip" {
  name = "data-vm-public-ip"
  location = azurerm_resource_group.rg-data-run.location
  allocation_method = "Static"
  resource_group_name = azurerm_resource_group.rg-data-run.name 
}

#Creating network interface 
resource "azurerm_network_interface" "data-vm-NIC" {
  name = "data-vm-NIC"
  location = azurerm_resource_group.rg-data-run.location
  resource_group_name = azurerm_resource_group.rg-data-run.name
  ip_configuration {
    name = "Internal"
    subnet_id = azurerm_subnet.subnet-data-run.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.data-vm-public-ip.id
  }
}