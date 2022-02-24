output "app_insights_connection_string" {
  description = "The Application Insights connection string used to allow monitoring on App Services"
  sensitive   = true
  value       = azurerm_application_insights.node.connection_string
}

output "app_insights_instrumentation_key" {
  description = "The Application Insights instrumentation key used to allow monitoring on App Services"
  sensitive   = true
  value       = azurerm_application_insights.node.instrumentation_key
}

output "app_service_plan_id" {
  description = "The id of the app service plan"
  value       = azurerm_app_service_plan.common_service_plan.id
}

output "endpoint_subnet_appeals_service_id" {
  description = "The id of the private endpoint subnet the appeals service apps are linked to for ingress traffic"
  value       = azurerm_subnet.appeals_service_ingress.id
}

output "endpoint_subnet_applications_service_id" {
  description = "The id of the private endpoint subnet the applications service apps are linked to for ingress traffic"
  value       = azurerm_subnet.applicatons_service_ingress.id
}

output "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  value       = azurerm_subnet.integration_subnet.id
}

output "private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  value       = azurerm_private_dns_zone.private_link.id
}
