resource "azurerm_private_endpoint" "private_endpoint" {
  count = var.odw_synapse_integration_enabled ? 1 : 0

  name                = "pins-pe-${local.service_name}-synapse-sql-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_service_connection {
    name                           = "pins-psc-${local.service_name}-synapse-sql-${local.resource_suffix}"
    private_connection_resource_id = one(data.terraform_remote_state.odw).outputs.synapse_workspace_id
    subresource_names              = ["sqlondemand"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-synapse-sql-${local.resource_suffix}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.sql_synapse.id]
  }
}
