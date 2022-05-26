resource "azurerm_log_analytics_workspace" "applications_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}
