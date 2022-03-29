resource "azurerm_monitor_metric_alert" "http_5xx" {
  for_each = toset(module.app_services.app_service_ids)

  name                = "Http5xx - ${reverse(split("/", each.key))[0]}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [each.key]
  description         = "Sends an alert when the App Service returns excess 5xx respones"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 4
  tags                = var.common_tags

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Count"
    operator         = "GreaterThan"
    threshold        = 10
  }

  action {
    action_group_id = var.action_group_low_id
  }
}

resource "azurerm_monitor_activity_log_alert" "app_service_stop" {
  for_each = toset(module.app_services.app_service_ids)

  name                = "App Service Stopped - ${reverse(split("/", each.key))[0]}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [each.key]
  description         = "Sends an alert when the App Service is stopped"
  tags                = var.common_tags

  criteria {
    resource_id    = each.key
    category       = "Administrative"
    operation_name = "Microsoft.Web/sites/stop/Action"
    level          = "Verbose"
  }

  action {
    action_group_id = var.action_group_low_id
  }
}
