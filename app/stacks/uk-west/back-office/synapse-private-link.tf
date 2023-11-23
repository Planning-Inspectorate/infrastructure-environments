# Private DNS Zones should live in the common
resource "azurerm_private_dns_zone" "sql_synase_dns_zone" {
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = azurerm_resource_group.back_office_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "zone_sql_link" {
  name                  = "synapse-dns-link"
  resource_group_name   = azurerm_resource_group.back_office_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.sql_synase_dns_zone.name
  virtual_network_id    = var.common_vnet_id
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "pins-pe-${local.service_name}-synapse-sql-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_service_connection {
    name = "pins-psc-${local.service_name}-synapse-sql-${local.resource_suffix}"
    # TODO: After POC is working, look at using terraform_remote_state instead
    private_connection_resource_id = join("/", ["/subscriptions", var.odw_subscription_id, "resourceGroups", var.odw_resource_group_name, "providers/Microsoft.Synapse/workspaces", var.odw_synapse_workspace_name])
    subresource_names              = ["sqlondemand"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-synapse-sql-${local.resource_suffix}"
    private_dns_zone_ids = [azurerm_private_dns_zone.sql_synase_dns_zone.id]
  }
}
