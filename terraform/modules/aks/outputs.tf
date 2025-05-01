output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the AKS cluster"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
  description = "The kubeconfig for the AKS cluster"
}