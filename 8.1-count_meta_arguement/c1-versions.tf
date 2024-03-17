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

# Random String Resource 
resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  numeric = false
}