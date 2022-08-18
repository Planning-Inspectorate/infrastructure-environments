resource "azurerm_servicebus_namespace" "back_office" {
  name                = "pins-sb-${var.service_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_servicebus_queue" "back_office_publish" {
  name         = "back-office-publish"
  namespace_id = azurerm_servicebus_namespace.back_office.id

  enable_partitioning = true
}
