resource "azurerm_monitor_metric_alert" "app_service_http_5xx" {
  name                = "Http 5xx - ${reverse(split("/", azurerm_linux_web_app.web_app.id))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = var.environment == "dev" ? false : true
  scopes              = [azurerm_linux_web_app.web_app.id]
  description         = "Sends an alert when the App Service returns excess 5xx respones"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = local.severity["${var.environment}"]
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Average"
    operator         = "GreaterThanOrEqual"
    threshold        = 1
  }

  action {
    action_group_id = var.action_group_low_id
  }
}

resource "azurerm_monitor_metric_alert" "app_service_response_time" {
  name                = "Response Time - ${reverse(split("/", azurerm_linux_web_app.web_app.id))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = var.environment == "dev" ? false : true
  scopes              = [azurerm_linux_web_app.web_app.id]
  description         = "Sends an alert when the App Service response exceeds 3 seconds"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = local.severity["${var.environment}"]
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HttpResponseTime"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 3
  }

  action {
    action_group_id = var.action_group_low_id
  }
}

resource "azurerm_monitor_activity_log_alert" "app_service_stop" {
  name                = "App Service Stopped - ${reverse(split("/", azurerm_linux_web_app.web_app.id))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = var.environment == "dev" ? false : true
  scopes              = [azurerm_linux_web_app.web_app.id]
  description         = "Sends an alert when the App Service is stopped"
  tags                = var.tags

  criteria {
    resource_id    = azurerm_linux_web_app.web_app.id
    category       = "Administrative"
    operation_name = "Microsoft.Web/sites/stop/Action"
  }

  action {
    action_group_id = var.action_group_low_id
  }
}

resource "azurerm_monitor_activity_log_alert" "app_service_delete" {
  name                = "App Service Deleted - ${reverse(split("/", azurerm_linux_web_app.web_app.id))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = var.environment == "dev" ? false : true
  scopes              = [azurerm_linux_web_app.web_app.id]
  description         = "Sends an alert when the App Service is deleted"
  tags                = var.tags

  criteria {
    resource_id    = azurerm_linux_web_app.web_app.id
    category       = "Administrative"
    operation_name = "Microsoft.Web/sites/Delete"
  }

  action {
    action_group_id = var.action_group_low_id
  }
}
