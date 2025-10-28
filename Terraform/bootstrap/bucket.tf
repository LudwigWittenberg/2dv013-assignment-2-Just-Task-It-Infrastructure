resource "google_storage_bucket" "tfstate" {
  name                        = "bucket-${lower(var.project_name)}"
  location                    = "EU"
  uniform_bucket_level_access = true
  versioning { enabled = true }
}

resource "google_storage_bucket_iam_member" "tfstate_object_admin" {
  bucket = google_storage_bucket.tfstate.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${var.email}"
}