output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "web_frontend_url" {
  description = "The URL of the web frontend app service"
  value       = module.app_services.web_frontend_url
}

output "back_office_document_storage_api_host" {
  description = "The full failover URI to the storage account used for back office documents"
  value       = azurerm_storage_account.back_office_documents.primary_blob_endpoint
}

output "back_office_document_storage_container_name" {
  description = "The back office blob storage container name"
  value       = azurerm_storage_container.back_office_documents_container.name
}

output "back_office_document_storage_documents_id" {
  description = "The azurerm_storage_account back_office_documents resource id"
  value       = azurerm_storage_account.back_office_documents.id
}

output "back_office_service_bus_connection_string" {
  description = "Connection strong for Azure Service Bus in Back Office"
  value       = azurerm_servicebus_namespace.back_office.default_primary_connection_string
  sensitive   = true
}

output "back_office_sql_database" {
  description = "The ID of the Back Office SQL database"
  value       = azurerm_mssql_database.back_office.id
}

output "document_check_function_storage_name" {
  description = "Function Storage name"
  value       = azurerm_storage_account.function_storage.name
}

output "document_check_function_storage_primary_access_key" {
  description = "Function Storage Primary Access Key"
  value       = azurerm_storage_account.function_storage.primary_access_key
  sensitive   = true
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

output "service_bus_namespace_name" {
  description = "The name of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.back_office.name
}

output "service_bus_nsip_project_topic_id" {
  description = "ID of the nsip-project Service Bus Topic"
  value       = azurerm_servicebus_topic.nsip_project.id
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

output "servicebus_queue_nsip_documents_to_publish_id" {
  description = "Service Bus Queue nsip-documents-to-publish id"
  value       = azurerm_servicebus_queue.nsip_documents_to_publish.id
}
