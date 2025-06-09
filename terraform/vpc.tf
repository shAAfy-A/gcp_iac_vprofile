module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "9.0.0"

  project_id   = var.project_id
  network_name = "vprofile-gke"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "gke-subnet"
      subnet_ip     = "10.10.0.0/16"
      subnet_region = "us-central1"
    }
  ]

  secondary_ranges = {
    "gke-subnet" = [
      {
        range_name    = "pod-range"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "service-range"
        ip_cidr_range = "10.30.0.0/16"
      }
    ]
  }
}