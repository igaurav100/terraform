# Resource group 
resource "azurerm_resource_group" "rg-mydata-run" {
  count = 3
  name = "rg-mydata-run-${count.index}"
  location = "East US"
}

