terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
  backend "gcs" {
    prefix = "staging/terraform-state"
  }
}

provider "google" {
  project = var.google_project_id
  region  = var.region
}

module "gke" {
  source      = "../modules/gke"
  google_project_id  = var.google_project_id
  region      = var.region
  project_name = var.project_name
  ipv6_access_type = var.ipv6_access_type
  stack_type = var.stack_type
  delete_protection = var.delete_protection
}
