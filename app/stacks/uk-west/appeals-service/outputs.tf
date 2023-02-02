output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "web_frontend_url" {
  description = "The URL of the web frontend app service"
  value       = module.app_services.web_frontend_url
}

output "appeal_documents_storage_container_name" {
  description = "The Appeal Documents Storage Account container name"
  value       = azurerm_storage_account.appeal_documents.name
}

output "appeal_documents_primary_blob_connection_string" {
  description = "The Appeal Documents Storage Account blob connection string associated with the primary location"
  sensitive   = true
  value       = azurerm_storage_account.appeal_documents.primary_blob_connection_string
}

output "cosmosdb_connection_string" {
  description = "The connection string used to connect to the MongoDB"
  sensitive   = true
  value       = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
}

output "cosmosdb_id" {
  description = "The ID of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.appeals_database.id
}

output "function_apps_storage_account" {
  description = "The name of the storage account used by the Function Apps"
  value       = azurerm_storage_account.function_apps.name
}

output "function_apps_storage_account_access_key" {
  description = "The access key for the storage account used by the Function Apps"
  sensitive   = true
  value       = azurerm_storage_account.function_apps.primary_access_key
}
