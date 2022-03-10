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

output "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
  value       = data.azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key.value
}

output "common_resource_group_name" {
  description = "The name of the common infrastructure resource group"
  value       = azurerm_resource_group.common_infrastructure.name
}

output "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  value       = module.common_vnet_address_space.network_cidr_blocks
}

output "common_vnet_gateway_id" {
  description = "The id of the common infrastructure virtual network gateway"
  value       = azurerm_virtual_network_gateway.common.id
}

output "common_vnet_name" {
  description = "The name of the common infrastructure virtual network"
  value       = azurerm_virtual_network.common_infrastructure.name
}

output "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  value       = azurerm_subnet.integration_subnet.id
}

output "key_vault_id" {
  description = "The ID of the key vault so App Services can pull secret values"
  value       = azurerm_key_vault.environment_key_vault.id
}

output "key_vault_secret_refs" {
  description = "Map of secret references from the Key Vault"
  value       = local.secret_refs
}
