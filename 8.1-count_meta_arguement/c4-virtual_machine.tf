resource "azurerm_linux_virtual_machine" "av-gw-mydata" {
  count = 2
  name = "av-gw-mydata-${count.index}"
  resource_group_name = azurerm_resource_group.rg-mydaya-run.name
  location = azurerm_resource_group.rg-mydaya-run.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ element(azurerm_network_interface.mynic[*].id, count.index) ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-key/pwd.pub")
  }
  os_disk {
    name = "av-gw-mydata-${count.index}"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
   publisher = "RedHat"
   offer =  "RHEL"
   sku = "83-gen2"
   version = "latest"
  }
}