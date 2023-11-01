resource "azurerm_log_analytics_workspace" "applcations_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_application_insights" "applications_app_insights" {
  name                = "pins-ai-${local.service_name}-${local.resource_suffix}-app-insights"
  location            = azurerm_resource_group.applications_service_stack.location
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  workspace_id        = azurerm_log_analytics_workspace.applcations_service.id
  application_type    = "web"
}
