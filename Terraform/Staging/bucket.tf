terraform {
  backend "gcs" {
    bucket = "${var.project_name}-bucket"
    prefix = "terraform-state"
  }
}