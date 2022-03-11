resource "azurerm_servicebus_namespace" "horizon" {
  name                = "pins-sb-horizon-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  sku                 = "Basic"

  tags = local.tags
}

resource "azurerm_servicebus_queue" "horizon_add_document" {
  name         = "add-document"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "horizon_create_contact" {
  name         = "create-contact"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  enable_partitioning = true
}

resource "azurerm_servicebus_queue" "horizon_householder_appeal_publish" {
  name         = "householder-appeal-publish"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  enable_partitioning = true
}

resource "azurerm_servicebus_namespace_authorization_rule" "horizon_function_apps" {
  name         = "horizon-function-apps"
  namespace_id = azurerm_servicebus_namespace.horizon.id

  listen = true
  send   = false
  manage = false
}
