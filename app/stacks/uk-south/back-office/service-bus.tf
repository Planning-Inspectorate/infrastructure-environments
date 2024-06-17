resource "azurerm_servicebus_namespace" "back_office" {
  count = var.service_bus_failover_enabled || var.is_dr_deployment ? 1 : 0

  name                          = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location                      = azurerm_resource_group.back_office_stack.location
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku                           = var.service_bus_failover_enabled ? "Premium" : "Standard"
  capacity                      = var.service_bus_failover_enabled ? 1 : 0
  public_network_access_enabled = !var.service_bus_failover_enabled
  premium_messaging_partitions  = var.service_bus_failover_enabled ? 1 : 0

  tags = local.tags
}

resource "azurerm_servicebus_namespace_disaster_recovery_config" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                 = "pins-sb-dr-${local.service_name}-${local.resource_suffix}"
  primary_namespace_id = var.primary_service_bus_namespace_id
  partner_namespace_id = azurerm_servicebus_namespace.back_office[0].id

  depends_on = [
    azurerm_private_endpoint.back_office
  ]
}

# https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-geo-dr#recommended-configuration
# Might be worth looking into this, for now let's just create a private link to the secondary NS
# Create a private DNS zone for the SB private endpoint
resource "azurerm_private_dns_zone" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                = "privatelink.servicebus.windows.net"
  resource_group_name = azurerm_resource_group.back_office_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                  = "service-bus-dns-link"
  resource_group_name   = azurerm_resource_group.back_office_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.back_office[0].name
  virtual_network_id    = var.common_vnet_id
}


# Create a private endpoint for the namespace
resource "azurerm_private_endpoint" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                = "pins-pe-${local.service_name}-sb-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "pins-pdns-${local.service_name}-sb-${local.resource_suffix}"
    private_dns_zone_ids = [azurerm_private_dns_zone.back_office[0].id]
  }

  private_service_connection {
    name                           = "pins-psc-${local.service_name}-sb-${local.resource_suffix}"
    private_connection_resource_id = azurerm_servicebus_namespace.back_office[0].id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }

  tags = local.tags
}
