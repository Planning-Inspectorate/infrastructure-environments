output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "back_office_sql_database" {
  description = "The ID of the Back Office SQL database"
  value       = azurerm_mssql_database.back_office.id
}

output "service_bus_namespace_id" {
  description = "The ID of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.back_office.id
}

output "sql_server_id" {
  description = "The ID of the Back Office SQL server"
  value       = azurerm_mssql_server.back_office.id
}

output "sql_server_password" {
  description = "The SQL server administrator password"
  sensitive   = true
  value       = random_password.back_office_sql_server_password.result
}

output "sql_server_username" {
  description = "The SQL server administrator username"
  sensitive   = true
  value       = local.sql_server_username
}
