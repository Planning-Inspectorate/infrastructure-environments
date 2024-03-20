output "action_group_ids" {
  description = "The Action Group IDs for the created groups, as k:v map"
  value = {
    for k, v in local.all_action_groups : k => azurerm_monitor_action_group.all_action_groups[k].id
  }
}

output "action_group_names" {
  description = "The Action Group names for the created groups, as k:v map"
  value = {
    for k, v in local.all_action_groups : k => "pins-ag-odt-${k}-${var.environment}"
  }
}

output "app_service_plan_id" {
  description = "The id of the app service plan"
  value       = azurerm_service_plan.common_service_plan.id
}

output "integration_functions_app_service_plan_id" {
  description = "The id of the integration app service plan"
  value       = azurerm_service_plan.common_integration_functions_service_plan.id
}

output "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
  value       = data.azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key.value
}

output "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
  value       = module.networking.back_office_integration_subnet_id
}

output "common_integration_functions_subnet_id" {
  description = "Integration subnet for the common integrations functions subnet"
  value       = module.networking.common_integration_functions_subnet_id
}

output "back_office_clamav_subnet_id" {
  description = "Integration subnet for the clamav container"
  value       = module.networking.back_office_clamav_subnet_id
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

output "key_vault_id" {
  description = "The ID of the key vault so App Services can pull secret values"
  value       = azurerm_key_vault.environment_key_vault.id
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.environment_key_vault.vault_uri
}

output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace so Front Door can log WAF events"
  value       = azurerm_log_analytics_workspace.common.id
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = module.networking.vnet_id
}
