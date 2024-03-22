output "resource_group_id" {
  description = "ID of resource group"
  value       = azurerm_resource_group.rg-uk-run.id
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.rg-uk-run.name
}

output "virtual_network_name" {
  description = "virtual network name"
  value       = azurerm_virtual_network.vnet-uk-dev.name
}