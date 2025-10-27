output "tf_sa_email" {
  value = google_service_account.tf.email
}

output "tfstate_bucket" {
  value = google_storage_bucket.tfstate.name
}

output "tf_sa_key_json" {
  description = "Service account key for GitHub (save as GOOGLE_CREDENTIALS secret)"
  value       = base64decode(google_service_account_key.tf_key.private_key)
  sensitive   = true
}