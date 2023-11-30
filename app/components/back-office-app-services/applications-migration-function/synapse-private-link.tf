# Private DNS Zones should live in the common
# These resources will be moved to the top-level stack (so only created for uk-west)
resource "azurerm_private_dns_zone" "sql_synase_dns_zone" {
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "zone_sql_link" {
  name                  = "synapse-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_synase_dns_zone.name
  virtual_network_id    = var.common_vnet_id
}

resource "azurerm_private_endpoint" "private_endpoint" {
  count = local.synapse_integration_enabled ? 1 : 0

  name                = "pins-pe-${local.service_name}-synapse-sql-${local.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.endpoint_subnet_id

  private_service_connection {
    name                           = "pins-psc-${local.service_name}-synapse-sql-${local.resource_suffix}"
    private_connection_resource_id = data.terraform_remote_state.odw.outputs.data_lake_account_id
    subresource_names              = ["sqlondemand"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-synapse-sql-${local.resource_suffix}"
    private_dns_zone_ids = [azurerm_private_dns_zone.sql_synase_dns_zone.id]
  }
}
