# Terraform Block 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}
# Provider block 
provider "azurerm" {
  features {}
}