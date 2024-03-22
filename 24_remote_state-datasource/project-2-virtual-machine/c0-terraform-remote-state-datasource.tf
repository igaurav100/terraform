# Terraform Remote State Datasource
data "terraform_remote_state" "project1" {
  backend = "azurerm"
  config = {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstorage100"
    container_name        = "tfstatefiles"
    key                   = "network-terraform.tfstate"
  }
}