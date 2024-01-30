output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "function_storage_name" {
  description = "Name of the Storage Account used for Function Apps"
  value       = azurerm_storage_account.function_storage.name
}

output "function_storage_primary_access_key" {
  description = "Primary access key of the Storage Account used for Function Apps"
  value       = azurerm_storage_account.function_storage.primary_access_key
  sensitive   = true
}

output "primary_applications_sql_server_id" {
  description = "ID of the primary (ukw) Applications SQL Server"
  value       = azurerm_mssql_server.applications_sql_server.id
}

output "primary_applications_sql_database_id" {
  description = "ID of the primary (ukw) Applications SQL database"
  value       = azurerm_mssql_database.applications_sql_db.id
}

output "primary_applications_sql_database_name" {
  description = "Name of the primary (ukw) Applications SQL Database"
  value       = azurerm_mssql_database.applications_sql_db.name
}

output "sql_server_password_admin" {
  description = "The SQL server administrator password"
  sensitive   = true
  value       = random_password.applications_sql_server_password_admin.result
}

output "sql_server_password_app" {
  description = "The SQL server app password"
  sensitive   = true
  value       = random_password.applications_sql_server_password_app.result
}

output "sql_server_username_admin" {
  description = "The SQL server administrator username"
  sensitive   = true
  value       = local.sql_server_username_admin
}

output "sql_server_username_app" {
  description = "The SQL server app username"
  sensitive   = true
  value       = local.sql_server_username_app
}


output "web_frontend_url" {
  description = "The URL of the web frontend app service"
  value       = module.app_services.web_frontend_url
}
