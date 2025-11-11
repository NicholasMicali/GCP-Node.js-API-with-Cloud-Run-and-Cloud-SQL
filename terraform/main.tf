terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Cloud Run Service for Node.js API with fixed scaling
resource "google_cloud_run_service" "nodejs_api" {
  name     = "nodejs-api"
  location = var.region

  template {
    spec {
      containers {
        image = var.cloud_run_image
      }
      container_concurrency = 80
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Allow unauthenticated access
}

# Cloud SQL PostgreSQL instance
resource "google_sql_database_instance" "postgres" {
  name             = "nodejs-sql-instance"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-custom-1-3840" # 1 vCPU, 4GB RAM

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "all"
        value = "0.0.0.0/0"
      }
    }
  }
}

# Cloud SQL user
resource "google_sql_user" "dbuser" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}

# Service Account for Cloud Run
resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-sql-sa"
  display_name = "Cloud Run Service Account for Cloud SQL"
}

# IAM binding for Cloud Run service account to access Cloud SQL
resource "google_cloud_run_service_iam_member" "cloudsql_client" {
  location = google_cloud_run_service.nodejs_api.location
  project  = var.project_id
  service  = google_cloud_run_service.nodejs_api.name
  role     = "roles/cloudsql.client"
  member   = "serviceAccount:${google_service_account.cloud_run_sa.email}"
}

# Firewall rule to allow HTTPS ingress
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https-ingress"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}

# Optional Cloud Run domain mapping (commented out by default)
# resource "google_cloud_run_domain_mapping" "custom_domain" {
#   location = google_cloud_run_service.nodejs_api.location
#   name     = var.custom_domain
#
#   spec {
#     service = google_cloud_run_service.nodejs_api.name
#   }
# }
