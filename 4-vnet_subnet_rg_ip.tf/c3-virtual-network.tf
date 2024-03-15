#Creating virtual network
resource "azurerm_virtual_network" "vnet-mydata-run" {
  name = "vnet-mydata-run"
  resource_group_name = azurerm_resource_group.rg-mydata-run.name
  location = azurerm_resource_group.rg-mydata-run.location
  address_space = [ "10.0.0.0/16" ]
  tags = {
    "rg" = "rg-mydata-run"
  }
}

#creating subnet
resource "azurerm_subnet" "subnet-connection" {
    name = "subnet-connection"
    resource_group_name = azurerm_resource_group.rg-mydata-run.name
    virtual_network_name = azurerm_virtual_network.vnet-mydata-run.name
    address_prefixes = [ "10.0.1.0/24" ]
  
}

resource "azurerm_subnet" "subnet-workload" {
    name = "subnet-workload"
    resource_group_name = azurerm_resource_group.rg-mydata-run.name
    virtual_network_name = azurerm_virtual_network.vnet-mydata-run.name
    address_prefixes = [ "10.0.2.0/24" ]
  
}

# Creating public ip 
resource "azurerm_public_ip" "av-gw-pip" {
    name = "av-gw-pip"
    resource_group_name = azurerm_resource_group.rg-mydata-run.name
    location = azurerm_resource_group.rg-mydata-run.location
    allocation_method = "Static"
    tags = {
      "env" = "dev"
    }  
}

# ceating the NIC 
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg-mydata-run.location
  resource_group_name = azurerm_resource_group.rg-mydata-run.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-connection.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "example1" {
  name                = "example-nic1"
  location            = azurerm_resource_group.rg-mydata-run.location
  resource_group_name = azurerm_resource_group.rg-mydata-run.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-workload.id
    private_ip_address_allocation = "Dynamic"
  }
}