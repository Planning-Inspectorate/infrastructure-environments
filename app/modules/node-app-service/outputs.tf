output "default_site_hostname" {
  description = "The Default Hostname associated with the App Service"
  value       = azurerm_app_service.app_service.default_site_hostname
}

output "principal_id" {
  description = "The ID of the principal associated with the App Service"
  value       = azurerm_app_service.app_service.identity.0.principal_id
}
