resource "azurerm_log_analytics_workspace" "applications_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_log_analytics_saved_search" "app_service_console_logs" {
  name                       = "App Service Console Logs"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.applications_service.id

  category     = "App Logs"
  display_name = "App Service Console Logs"
  query        = "AppServiceConsoleLogs"
}
