data "azurerm_virtual_network" "vnetds" {
  name = azurerm_virtual_network.myvnet.name
  resource_group_name = azurerm_resource_group.myrg.name
}

output "ds_vnet_name" {
    value = data.azurerm_virtual_network.vnetds.name  
}

output "ds_vnet_id" {
    value = data.azurerm_virtual_network.vnetds.id
}

output "ds_vnet_address_space" {
    value = data.azurerm_virtual_network.vnetds.address_space
}