# Resource Group
resource "azurerm_resource_group" "rg-uk-run" {
  name = "rg-${var.resoure_group_name}-${var.environment}"
  location = var.resoure_group_location
}