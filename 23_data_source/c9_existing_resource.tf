data "azurerm_resource_group" "rgds1" {
  name = "ds_demo"
}

output "rgds_name" {
  value = data.azurerm_resource_group.rgds1.name
}

output "rgds_id" {
  value = data.azurerm_resource_group.rgds1.id
}

output "rgds_location" {
  value = data.azurerm_resource_group.rgds1.location
}