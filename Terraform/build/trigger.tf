resource "google_cloudbuild_trigger" "github-trigger" {
  location          = var.region
  name              = "${var.project_name}-trigger"
  repository_event_config {
    repository = google_cloudbuildv2_repository.github.id
    push {
      branch = "^main$"
    }
  }
  filename = "cloudbuild.yaml"
}