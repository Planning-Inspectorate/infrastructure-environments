resource "azurerm_subnet" "cosmosdb" {
  name                                           = "pins-snet-appeals-database-${local.resource_suffix}"
  resource_group_name                            = var.common_resource_group_name
  virtual_network_name                           = var.common_vnet_name
  address_prefixes                               = [var.common_vnet_cidr_blocks["cosmosdb_endpoint"]]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_private_endpoint" "cosmosdb" {
  name                = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  subnet_id           = azurerm_subnet.cosmosdb.id

  private_service_connection {
    name                           = "appealsdatabase"
    private_connection_resource_id = var.cosmosdb_id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  tags = local.tags
}
