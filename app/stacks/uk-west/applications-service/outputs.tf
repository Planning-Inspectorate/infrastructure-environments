output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}

output "web_frontend_url" {
  description = "The URL of the web frontend app service"
  value       = module.app_services.web_frontend_url
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
