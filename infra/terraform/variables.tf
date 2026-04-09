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
