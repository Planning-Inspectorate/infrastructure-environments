resource "azurerm_log_analytics_workspace" "common" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  location            = azurerm_resource_group.common_infrastructure.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}
