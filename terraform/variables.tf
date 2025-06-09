variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "clusterName" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "vprofile-gke"
}

variable "node_locations" {
  description = "List of zones in the region"
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b"]
}