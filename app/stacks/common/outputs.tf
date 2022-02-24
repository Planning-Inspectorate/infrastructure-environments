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

output "common_network_name" {
  description = "The name of the common infrastructure virtual network"
  value       = azurerm_virtual_network.common_infrastructure.name
}

output "common_resource_group_name" {
  description = "The name of the common infrastructure resource group"
  value       = azurerm_resource_group.common_infrastructure.name
}

output "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  value       = azurerm_subnet.integration_subnet.id
}

output "private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  value       = azurerm_private_dns_zone.private_link.id
}
