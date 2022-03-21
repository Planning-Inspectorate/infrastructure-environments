output "cosmosdb_subnet_id" {
  description = "The id of the Cosmos DB endpoint subnet"
  value       = azurerm_subnet.cosmosdb.id
}

output "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  value       = azurerm_subnet.integration_subnet.id
}

output "vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  value       = module.vnet_address_space.network_cidr_blocks
}

output "vnet_gateway_id" {
  description = "The id of the common infrastructure virtual network gateway"
  value       = length(azurerm_virtual_network_gateway.common) > 0 ? azurerm_virtual_network_gateway.common[0].id : null
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.common_infrastructure.id
}

output "vnet_name" {
  description = "The name of the common infrastructure virtual network"
  value       = azurerm_virtual_network.common_infrastructure.name
}
