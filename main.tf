provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "solab_aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "solaborate_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.solab_aks_rg.name
  location                 = azurerm_resource_group.solab_aks_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "solaborate_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.solaborate_sa.name
  container_access_type = "private"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.kubernetes_cluster_name
  location            = azurerm_resource_group.solab_aks_rg.location
  resource_group_name = azurerm_resource_group.solab_aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}
