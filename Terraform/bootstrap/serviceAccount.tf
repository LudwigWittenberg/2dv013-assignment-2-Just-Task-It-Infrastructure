# Roles for infra management
resource "google_project_iam_member" "container_admin" {
  depends_on = [google_project_service.apis]

  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${var.email}"
}

resource "google_project_iam_member" "network_admin" {
  depends_on = [google_project_service.apis]

  project = var.project_id
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${var.email}"
}

resource "google_project_iam_member" "artifactregistry_admin" {
  depends_on = [google_project_service.apis]

  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${var.email}"
}

resource "google_project_iam_member" "storage_admin" {
  depends_on = [google_project_service.apis]

  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${var.email}"
}

# Allow Terraform service account to use the default Compute Engine service account
resource "google_service_account_iam_member" "compute_sa_user" {
  depends_on = [google_project_service.apis]

  service_account_id = "projects/${var.project_id}/serviceAccounts/${data.google_compute_default_service_account.default.email}"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.email}"
}

data "google_compute_default_service_account" "default" {
  project = var.project_id
}
