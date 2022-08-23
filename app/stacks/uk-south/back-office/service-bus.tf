resource "azurerm_servicebus_namespace" "back_office" {
  count               = var.is_dr_deployment ? 1 : 0
  name                = "pins-sb-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  sku                 = "Standard"

  tags = local.tags
}

resource "azurerm_servicebus_queue" "back_office_publish" {
  count        = var.is_dr_deployment ? 1 : 0
  name         = "back-office-publish"
  namespace_id = azurerm_servicebus_namespace.back_office[count.index].id

  enable_partitioning = true
}
