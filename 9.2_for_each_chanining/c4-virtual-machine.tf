# Resource: Azure linux virtual machine
resource "azurerm_linux_virtual_machine" "av-uks-data-dev-gw" {
#   for_each =  toset(["vm1", "vm2"])
  for_each = azurerm_network_interface.myvmnic # for each chaning 
  name = "av-uks-data-dev-gw-${each.key}"
  resource_group_name = azurerm_resource_group.rg-uks-data-dev.name
  location = azurerm_resource_group.rg-uks-data-dev.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.myvmnic[each.key].id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-key/PWD.pub")
  }
  os_disk {
    name = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
}


