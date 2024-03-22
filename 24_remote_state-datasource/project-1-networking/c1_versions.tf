terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }  
  }
  backend "azurerm" {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstorage100"
    container_name = "tfstatefiles"
    key = "network-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}