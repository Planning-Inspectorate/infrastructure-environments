resource "azurerm_servicebus_namespace" "back_office" {
  count = var.service_bus_failover_enabled || var.is_dr_deployment ? 1 : 0

  name                = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  sku                 = var.service_bus_failover_enabled ? "Premium" : "Standard"
  capacity            = var.service_bus_failover_enabled ? 1 : 0

  tags = local.tags
}

resource "azurerm_servicebus_namespace_disaster_recovery_config" "back_office" {
  count = var.service_bus_failover_enabled ? 1 : 0

  name                 = "pins-sb-dr-${local.service_name}-${local.resource_suffix}"
  primary_namespace_id = var.primary_service_bus_namespace_id
  partner_namespace_id = azurerm_servicebus_namespace.back_office[0].id
}
