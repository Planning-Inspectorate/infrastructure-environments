output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "back_office_document_storage_api_host" {
  description = "The full failover URI to the storage account used for back office documents"
  value       = azurerm_storage_account.back_office_documents.secondary_blob_endpoint
}

output "back_office_document_storage_container_name" {
  description = "The back office blob storage container name"
  value       = azurerm_storage_container.back_office_documents_container.name
}

output "back_office_document_storage_documents_id" {
  description = "The azurerm_storage_account back_office_documents resource id"
  value       = azurerm_storage_account.back_office_documents.id
}

output "back_office_sql_database" {
  description = "The ID of the Back Office SQL database"
  value       = azurerm_mssql_database.back_office.id
}

output "function_apps_storage_account" {
  description = "Function app storage account"
  value       = azurerm_storage_account.function_storage.name
}

output "function_apps_storage_account_access_key" {
  description = "Function app storage account access key"
  sensitive   = true
  value       = azurerm_storage_account.function_storage.primary_access_key
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
