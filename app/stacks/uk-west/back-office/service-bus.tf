resource "azurerm_servicebus_namespace" "back_office" {
  name                = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  sku                 = var.service_bus_failover_enabled ? "Premium" : "Standard"
  capacity            = var.service_bus_failover_enabled ? 1 : 0

  tags = local.tags
}

resource "azurerm_servicebus_topic" "case_started" {
  name         = "case-started"
  namespace_id = azurerm_servicebus_namespace.back_office.id
}

resource "azurerm_servicebus_subscription" "back_office_api" {
  name               = "back-office-api-subscriber"
  topic_id           = azurerm_servicebus_topic.case_started.id
  max_delivery_count = 1
}

resource "azurerm_servicebus_namespace_authorization_rule" "back_office_apps" {
  name         = "back-office-apps"
  namespace_id = azurerm_servicebus_namespace.back_office.id

  listen = true
  send   = true
  manage = false
}
