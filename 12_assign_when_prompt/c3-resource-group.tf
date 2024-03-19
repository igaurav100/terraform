# Resource Group 
resource "azurerm_resource_group" "rg-uks-ai-dev" {
    name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
#   name = var.resource_group_name  
#   name = "${var.resource_group_name}-somename"
  location = var.resource_group_location
}