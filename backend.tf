terraform {
  backend "azurerm" {
    resource_group_name   = "solabaksResourceGroup"
    storage_account_name  = "solaboratestorageacc"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
