output "cluster_name" {
  description = "GKE Cluster Name"
  value       = module.gke.name
}

output "cluster_endpoint" {
  description = "Endpoint for GKE cluster"
  value       = module.gke.endpoint
  sensitive = true
}

output "region" {
  description = "GKE Cluster region"
  value       = var.region
}