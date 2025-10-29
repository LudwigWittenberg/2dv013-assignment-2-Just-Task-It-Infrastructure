resource "google_cloudbuild_trigger" "include-build-logs-trigger" {
  for_each = toset(var.cluster_name)
  location = var.region
  name     = "${lower(var.project_name)}-${each.value}-build-trigger"
  filename = "cloudbuild.yaml"

  github {
    owner = "LudwigWittenberg"
    name  = "terraform-provider-google-beta"
    push {
      branch = "^main$"
    }
  }

  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}