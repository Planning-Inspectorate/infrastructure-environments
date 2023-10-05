output "default_site_hostname" {
  description = "The Default Hostname associated with the App Service"
  value       = azurerm_linux_web_app.web_app.default_hostname
}

output "principal_id" {
  description = "The ID of the principal associated with the App Service"
  value       = azurerm_linux_web_app.web_app.identity[0].principal_id
}

output "secrets_manual" {
  description = "List of Key Vault secrets required for this component"
  value       = local.secrets_manual
}
