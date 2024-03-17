# Creating RG for UKS
resource "azurerm_resource_group" "rg-uks-data-dev" {
  name = "uks-data-dev"
  location = "East US"
}