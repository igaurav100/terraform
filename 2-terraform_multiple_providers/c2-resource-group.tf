resource "azurerm_resource_group" "rg-myspace-run" {
  name = "rg-myspace-run"
  location = "eastus"  
}

resource "azurerm_resource_group" "rg-myspace-one-run" {
  name = "rg-myspace-run-one"
  location = "westus"
  provider = azurerm.provider2-westus #alias of provider 2
}