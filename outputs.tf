output "resource_group_name" {
  value = azurerm_resource_group.solab_aks_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.solaborate_sa.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}
