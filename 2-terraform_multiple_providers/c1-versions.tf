# Terraform block 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
#   subscription_id = "sdghgsdguieywr84rufdcbj"
# client_id = "skjdhd93ehdigi"
  alias = "provider2-westus"
}