terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
    features {}
  # Configuration options
}

resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}