terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Random String 
resource "random_string" "myrandom" {
  length = 6
  special = false
  upper = false
  numeric = false
}