# resource "google_cloudbuild_trigger" "github-trigger" {
#   project           = var.project_id
#   location          = var.region
#   name              = "${var.project_name}-trigger"
#   repository_event_config {
#     repository = google_cloudbuildv2_repository.github.id
#     push {
#       branch = "main"
#     }
#   }

#   filename = "cloudbuild.yaml"

#   depends_on = [
#     google_cloudbuildv2_connection.github_connection,
#     google_cloudbuildv2_repository.github
#   ]

# }