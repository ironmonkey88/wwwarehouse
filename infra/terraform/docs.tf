resource "google_storage_bucket" "docs" {
  name          = "docs-011793-factory"
  location      = var.region
  force_destroy = false

  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  # Enable Static Website hosting
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html" # Spa fallback
  }

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "OPTIONS"]
    response_header = ["*"]
    max_age_seconds = 3600
  }

  # Labels for cost hygiene
  labels = {
    env       = "dev"
    project   = "wwwarehouse"
    type      = "documentation"
    managedby = "terraform"
  }
}

# Output the URL for referencing the CNAME
output "docs_bucket_url" {
  value       = "https://storage.googleapis.com/${google_storage_bucket.docs.name}/index.html"
  description = "The direct GCS URL for the dbt documentation."
}
