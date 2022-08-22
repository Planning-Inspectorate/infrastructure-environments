resource "azurerm_servicebus_namespace" "back_office" {
  name                = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  sku                 = "Standard"

  tags = local.tags
}

resource "azurerm_servicebus_queue" "back_office_publish" {
  name         = "back-office-publish"
  namespace_id = azurerm_servicebus_namespace.back_office.id

  enable_partitioning = true
}
