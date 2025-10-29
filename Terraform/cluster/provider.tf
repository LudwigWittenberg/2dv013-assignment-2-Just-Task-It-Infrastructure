terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
  backend "gcs" {
    prefix = "${var.bucket_state_map_prefix}/terraform-state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
