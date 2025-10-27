resource "google_service_account" "tf" {
  account_id   = "${lower(var.project_name)}-tf"
  display_name = "${lower(var.project_name)} Terraform Service Account"
}

# Roles for infra management
resource "google_project_iam_member" "container_admin" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.tf.email}"
}

resource "google_project_iam_member" "network_admin" {
  project = var.project_id
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.tf.email}"
}

resource "google_project_iam_member" "artifactregistry_admin" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.tf.email}"
}

resource "google_project_iam_member" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.tf.email}"
}

resource "google_service_account_key" "tf_key" {
  service_account_id = google_service_account.tf.name
}
