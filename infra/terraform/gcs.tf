resource "google_storage_bucket" "warehouse" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = false # Protect production data

  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      num_newer_versions = 5
    }
    action {
      type = "Delete"
    }
  }

  # Labels for cost hygiene
  labels = {
    env       = "dev"
    project   = "wwwarehouse"
    managedby = "terraform"
  }
}
