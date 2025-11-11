output "cloud_run_service_url" {
  description = "The HTTPS URL of the deployed Cloud Run service"
  value       = google_cloud_run_service.nodejs_api.status[0].url
}

output "cloud_sql_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.postgres.connection_name
}

output "cloud_sql_instance_public_ip" {
  description = "The public IP address of the Cloud SQL instance"
  value       = google_sql_database_instance.postgres.public_ip_address
}

output "cloud_run_service_account_email" {
  description = "The email of the service account used by Cloud Run"
  value       = google_service_account.cloud_run_sa.email
}
