resource "google_compute_network" "default" {
  name = "${lower(var.project_name)}-network"

  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}

resource "google_compute_subnetwork" "default" {
  name = "${lower(var.project_name)}-subnetwork"

  ip_cidr_range = "10.0.0.0/16"
  region        = var.region

  stack_type       = var.stack_type
  ipv6_access_type = var.ipv6_access_type

  network = google_compute_network.default.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.0.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.1.0/24"
  }
}