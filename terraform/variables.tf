variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "cloud_run_image" {
  description = "Container image URI for the Node.js API deployed to Cloud Run"
  type        = string
}

variable "db_user" {
  description = "Username for the Cloud SQL database user"
  type        = string
  default     = "nodejsuser"
}

variable "db_password" {
  description = "Password for the Cloud SQL database user"
  type        = string
  sensitive   = true
}

variable "custom_domain" {
  description = "Optional custom domain for Cloud Run domain mapping"
  type        = string
  default     = ""
}
