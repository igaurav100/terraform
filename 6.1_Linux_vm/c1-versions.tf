# Terraform Block
terraform {
  required_providers { # Providers Block
    azurerm = { # provider 1
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
    random = { # provider 2
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}
# provider block (main)
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