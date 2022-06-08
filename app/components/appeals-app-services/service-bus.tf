resource "azurerm_servicebus_namespace" "horizon" {
  name                = "pins-sb-horizon-${var.service_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_servicebus_queue" "horizon_householder_appeal_publish" {
  name         = "horizon-householder-appeal-publish"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  enable_partitioning = true
}

resource "azurerm_servicebus_namespace_authorization_rule" "horizon_function_apps" {
  name         = "horizon-function-apps"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  listen = false
  send   = true
  manage = false
}
