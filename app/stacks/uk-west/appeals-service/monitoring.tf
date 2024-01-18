resource "azurerm_log_analytics_workspace" "appeals_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  location            = azurerm_resource_group.appeals_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_application_insights" "web_app_insights" {
  name                = "pins-ai-${local.service_name}-${local.resource_suffix}-app-insights"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  workspace_id        = azurerm_log_analytics_workspace.appeals_service.id
  application_type    = "web"
}

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "web_app_insights" {
  name         = "horizon-submission-failure-alerts"
  display_name = "horizon appeal submission failures"
  description  = "Triggered when the horizon submission process fails more than 3 times in an hour"

  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  scopes              = [module.app_services.app_service_ids["appeals_service_api_${module.azure_region_primary.location_short}"]]



  enabled                          = var.monitoring_alerts_enabled
  auto_mitigation_enabled          = true
  workspace_alerts_storage_enabled = false

  evaluation_frequency = "PT1H"
  window_duration      = "PT1H"

  criteria {
    query                   = <<-QUERY
      AppServiceConsoleLogs
      | where ResultDescription has "scheduled submission to horizon has errored|failed|uncompleted submissions"
        or ResultDescription has "scheduled submission to horizon has failed"
      QUERY
    time_aggregation_method = "Count"
    threshold               = 3
    operator                = "GreaterThan"
  }

  severity = 2
  action {
    action_groups = [var.action_group_low_id]
  }
}
