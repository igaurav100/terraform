# Virtual network 
resource "azurerm_virtual_network" "vnet-mydata-run" {
  name = "vnet-mydata-run"
  resource_group_name = azurerm_resource_group.rg-mydaya-run.name
  location = azurerm_resource_group.rg-mydaya-run.location
  address_space = [ "10.0.0.0/16" ]  
}
# subnet 
resource "azurerm_subnet" "subnet-connection" {
  name = "subnet-connection"
  resource_group_name = azurerm_resource_group.rg-mydaya-run.name
  virtual_network_name = azurerm_virtual_network.vnet-mydata-run.name
  address_prefixes = [ "10.0.2.0/24" ]
}

# Create public ip 
resource "azurerm_public_ip" "mypublicip" {
    count = 2
    name = "mypublicip-${count.index}"
    resource_group_name = azurerm_resource_group.rg-mydaya-run.name
    location = azurerm_resource_group.rg-mydaya-run.location
    allocation_method = "Static"
}

# network interface 
resource "azurerm_network_interface" "mynic" {
  count = 2
  name = "mynic-${count.index}"
  location = azurerm_resource_group.rg-mydaya-run.location
  resource_group_name = azurerm_resource_group.rg-mydaya-run.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet-connection.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id, count.index)
  }
}