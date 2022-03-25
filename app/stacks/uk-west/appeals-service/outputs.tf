output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
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

output "function_apps_storage_account_primary_access_key" {
  description = "The access key of the storage account used by the Function Apps"
  sensitive   = true
  value       = azurerm_storage_account.function_apps.primary_access_key
}
