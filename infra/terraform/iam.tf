resource "google_service_account" "factory_runner" {
  account_id   = "factory-runner"
  display_name = "WWWarehouse Factory Runner"
  description  = "Service account for autonomous ingestion and refinery jobs"
}

resource "google_storage_bucket_iam_member" "warehouse_admin" {
  bucket = google_storage_bucket.warehouse.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.factory_runner.email}"
}

# Output the SA email for the user
output "factory_runner_sa" {
  value       = google_service_account.factory_runner.email
  description = "The email of the factory-runner service account"
}

output "warehouse_bucket_url" {
  value       = google_storage_bucket.warehouse.url
  description = "The URL of the GCS Warehouse bucket"
}
