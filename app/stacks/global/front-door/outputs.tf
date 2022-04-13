output "frontend_endpoint_mappings" {
  description = "A map of maps containing configuration options for each frontend endpoint"
  value       = local.frontend_endpoint_mappings
}

output "frontend_endpoints" {
  description = "A map of frontend endpoints within the Front Door instance"
  value       = azurerm_frontdoor.common.frontend_endpoints
}
