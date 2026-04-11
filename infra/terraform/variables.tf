variable "project_id" {
  description = "The GCP Project ID"
  type        = string
  default     = "gen-lang-client-0117935224"
}

variable "region" {
  description = "The GCP region for the warehouse"
  type        = string
  default     = "us-east1"
}

variable "bucket_name" {
  description = "The name of the GCS Warehouse bucket"
  type        = string
  default     = "warehouse-011793-factory"
}

variable "gcs_access_key_id" {
  description = "GCS Interoperability Access Key ID"
  type        = string
  sensitive   = true
}

variable "gcs_secret_access_key" {
  description = "GCS Interoperability Secret Access Key"
  type        = string
  sensitive   = true
}

variable "firebase_token" {
  description = "Firebase CI token for automated deployment"
  type        = string
  sensitive   = true
}
