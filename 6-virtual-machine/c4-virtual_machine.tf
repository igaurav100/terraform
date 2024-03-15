# Azure linux VM 
resource "azurerm_linux_virtual_machine" "av-gw-data-vm" {
  name = "av-gw-data-vm"
  computer_name = "av-gw-data-vm" #hostname
  resource_group_name = azurerm_resource_group.rg-data-run.name
  location = azurerm_resource_group.rg-data-run.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.data-vm-NIC.id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/pwd.pub")
  }
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"    
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
}