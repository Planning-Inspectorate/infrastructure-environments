resource "azurerm_private_endpoint" "cosmosdb" {
  count = var.database_public_access_enabled ? 0 : 1

  name                = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  subnet_id           = var.cosmosdb_subnet_id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.cosmosdb.id]
  }

  private_service_connection {
    name                           = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
    private_connection_resource_id = var.cosmosdb_id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  tags = local.tags
}
