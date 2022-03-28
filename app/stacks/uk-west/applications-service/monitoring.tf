resource "azurerm_monitor_metric_alert" "http_5xx" {
  name                = "HttpResponse5xx"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = module.app_services.app_service_ids
  description         = "Sends an alert when app services return excess 5xx respones"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 4
  tags                = var.common_tags

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http Server Errors"
    aggregation      = "Count"
    operator         = "GreaterThan"
    threshold        = 10
  }

  action {
    action_group_id = var.action_group_low_id
  }
}
