resource "google_container_cluster" "default" {
  for_each = toset(var.cluster_name)

  name = "${lower(var.project_name)}-${each.value}-autopilot-cluster"

  location                 = var.region
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  network    = google_compute_network.default[each.key].id
  subnetwork = google_compute_subnetwork.default[each.key].id

  ip_allocation_policy {
    stack_type                    = var.stack_type
    services_secondary_range_name = google_compute_subnetwork.default[each.key].secondary_ip_range[0].range_name
    cluster_secondary_range_name  = google_compute_subnetwork.default[each.key].secondary_ip_range[1].range_name
  }

  # Set `deletion_protection` to `true` will ensure that one cannot
  # accidentally delete this instance by use of Terraform.
  deletion_protection = var.delete_protection
}