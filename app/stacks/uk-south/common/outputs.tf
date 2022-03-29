output "app_insights_connection_string" {
  description = "The Application Insights connection string used to allow monitoring on App Services"
  sensitive   = true
  value       = length(azurerm_application_insights.node) > 0 ? azurerm_application_insights.node[0].connection_string : null
}

output "app_insights_instrumentation_key" {
  description = "The Application Insights instrumentation key used to allow monitoring on App Services"
  sensitive   = true
  value       = length(azurerm_application_insights.node) > 0 ? azurerm_application_insights.node[0].instrumentation_key : null
}

output "app_service_plan_id" {
  description = "The id of the app service plan"
  value       = length(azurerm_service_plan.common_service_plan) > 0 ? azurerm_service_plan.common_service_plan[0].id : null
}

output "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
  value       = var.applications_service_vpn_gateway_shared_key
}

output "common_resource_group_name" {
  description = "The name of the common infrastructure resource group"
  value       = azurerm_resource_group.common_infrastructure.name
}

output "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  value       = module.networking.vnet_cidr_blocks
}

output "common_vnet_gateway_id" {
  description = "The id of the common infrastructure virtual network gateway"
  value       = module.networking.vnet_gateway_id
}

output "common_vnet_name" {
  description = "The name of the common infrastructure virtual network"
  value       = module.networking.vnet_name
}

output "cosmosdb_subnet_id" {
  description = "The id of the Cosmos DB endpoint subnet"
  value       = module.networking.cosmosdb_subnet_id
}

output "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  value       = module.networking.integration_subnet_id
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = module.networking.vnet_id
}
