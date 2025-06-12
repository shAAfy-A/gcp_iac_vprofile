module "gke" {
  source           = "terraform-google-modules/kubernetes-engine/google"
  version          = "30.1.0"
  project_id       = var.project_id
  name             = local.cluster_name
  region           = var.region
  #node_locations   = var.node_locations
  network          = module.vpc.network_name
  subnetwork       = module.vpc.subnets["us-central1/gke-subnet"].name
  ip_range_pods    = "pod-range"
  ip_range_services = "service-range"

  node_pools = [
    {
      name               = "node-pool-1"
      machine_type       = "e2-standard-2"
      total_min_node_count          = 1
      total_max_node_count          = 3
      initial_node_count = 2
    },
    {
      name               = "node-pool-2"
      machine_type       = "e2-small"
      total_min_node_count          = 1
      total_max_node_count          = 2
      initial_node_count = 1
    },
  ]
}