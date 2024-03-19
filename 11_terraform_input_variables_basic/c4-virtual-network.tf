# Creat Virtual Network 
resource "azurerm_virtual_network" "vnet-uks-ai-dev" {
  name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  resource_group_name = azurerm_resource_group.rg-uks-ai-dev.name
  location            = azurerm_resource_group.rg-uks-ai-dev.location
  address_space       = ["10.0.0.0/16"]
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.rg-uks-ai-dev.name
  virtual_network_name = azurerm_virtual_network.vnet-uks-ai-dev.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.rg-uks-ai-dev.name
  location            = azurerm_resource_group.rg-uks-ai-dev.location
  allocation_method   = "Static"
#   domain_name_label = "app1-vm-${random_string.myrandom.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name                = "vmnic"
  location            = azurerm_resource_group.rg-uks-ai-dev.location
  resource_group_name = azurerm_resource_group.rg-uks-ai-dev.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
}

