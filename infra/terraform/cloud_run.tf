# Cloud Run Jobs & Secret Manager for WWWarehouse 🦅

# 1. GCS Credentials (Secret Manager)
resource "google_secret_manager_secret" "gcs_access_key" {
  secret_id = "gcs-access-key-id"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "gcs_access_key_v1" {
  secret      = google_secret_manager_secret.gcs_access_key.id
  secret_data = var.gcs_access_key_id
}

resource "google_secret_manager_secret" "gcs_secret_key" {
  secret_id = "gcs-secret-access-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "gcs_secret_key_v1" {
  secret      = google_secret_manager_secret.gcs_secret_key.id
  secret_data = var.gcs_secret_access_key
}

# 2. Firebase CI Token (Secret Manager)
resource "google_secret_manager_secret" "firebase_token" {
  secret_id = "firebase-token"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "firebase_token_v1" {
  secret      = google_secret_manager_secret.firebase_token.id
  secret_data = var.firebase_token
}

# 3. Permissions for the Factory Runner to access secrets
resource "google_secret_manager_secret_iam_member" "access_key_accessor" {
  secret_id = google_secret_manager_secret.gcs_access_key.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.factory_runner.email}"
}

resource "google_secret_manager_secret_iam_member" "secret_key_accessor" {
  secret_id = google_secret_manager_secret.gcs_secret_key.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.factory_runner.email}"
}

resource "google_secret_manager_secret_iam_member" "firebase_token_accessor" {
  secret_id = google_secret_manager_secret.firebase_token.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.factory_runner.email}"
}

# 4. Permissions for Cloud Build to access secrets
resource "google_secret_manager_secret_iam_member" "cb_gcs_id_accessor" {
  secret_id = google_secret_manager_secret.gcs_access_key.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_secret_manager_secret_iam_member" "cb_gcs_secret_accessor" {
  secret_id = google_secret_manager_secret.gcs_secret_key.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_secret_manager_secret_iam_member" "cb_firebase_token_accessor" {
  secret_id = google_secret_manager_secret.firebase_token.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

# Add project data source if not already present
data "google_project" "project" {}

# 5. Cloud Run Job: The Sovereign Refinery
resource "google_cloud_run_v2_job" "refinery" {
  name     = "sovereign-refinery"
  location = var.region

  template {
    template {
      service_account = google_service_account.factory_runner.email
      containers {
        image = "gcr.io/${var.project_id}/sovereign-refinery:latest"

        env {
          name = "GCS_ACCESS_KEY_ID"
          value_source {
            secret_key_ref {
              secret  = google_secret_manager_secret.gcs_access_key.secret_id
              version = "latest"
            }
          }
        }

        env {
          name = "GCS_SECRET_ACCESS_KEY"
          value_source {
            secret_key_ref {
              secret  = google_secret_manager_secret.gcs_secret_key.secret_id
              version = "latest"
            }
          }
        }

        env {
          name  = "WAREHOUSE_PATH"
          value = "s3://${var.bucket_name}"
        }

        resources {
          limits = {
            cpu    = "2"
            memory = "4Gi"
          }
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      template[0].template[0].containers[0].image,
    ]
  }
}
