resource "azurerm_servicebus_namespace" "back_office" {
  count = var.service_bus_namespace_config.secondary_enabled || var.is_dr_deployment ? 1 : 0

  name                          = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location                      = azurerm_resource_group.back_office_stack.location
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku                           = var.service_bus_namespace_config.sku
  capacity                      = var.service_bus_namespace_config.capacity
  public_network_access_enabled = var.service_bus_namespace_config.public_network_access_enabled
  premium_messaging_partitions  = var.service_bus_namespace_config.premium_messaging_partitions

  tags = local.tags
}

# Create a private endpoint for the namespace
resource "azurerm_private_endpoint" "back_office" {
  count = (var.service_bus_namespace_config.secondary_enabled && var.service_bus_namespace_config.private_endpoint_enabled) ? 1 : 0

  name                = "pins-pe-${local.service_name}-sb-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-sb-${local.resource_suffix}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.service_bus.id]
  }

  private_service_connection {
    name                           = "pins-psc-${local.service_name}-sb-${local.resource_suffix}"
    private_connection_resource_id = azurerm_servicebus_namespace.back_office[0].id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }

  tags = local.tags
}
