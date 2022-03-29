resource "azurerm_monitor_metric_alert" "app_service_http_5xx" {
  for_each = toset([for k, v in module.app_service : v.app_service_id])

  name                = "Http 5xx - ${reverse(split("/", each.key))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = true # var.environment == 'dev' ? false : true
  scopes              = [each.key]
  description         = "Sends an alert when the App Service returns excess 5xx respones"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = local.severity["${var.environment}"].value
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
  for_each = toset([for k, v in module.app_service : v.app_service_id])

  name                = "Response Time - ${reverse(split("/", each.key))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = true # var.environment == 'dev' ? false : true
  scopes              = [each.key]
  description         = "Sends an alert when the App Service response exceeds 3 seconds"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = local.severity["${var.environment}"].value
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
  for_each = toset([for k, v in module.app_service : v.app_service_id])

  name                = "App Service Stopped - ${reverse(split("/", each.key))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = true # var.environment == 'dev' ? false : true
  scopes              = [each.key]
  description         = "Sends an alert when the App Service is stopped"
  tags                = var.tags

  criteria {
    resource_id    = each.key
    category       = "Administrative"
    operation_name = "Microsoft.Web/sites/stop/Action"
  }

  action {
    action_group_id = var.action_group_low_id
  }
}

resource "azurerm_monitor_activity_log_alert" "app_service_delete" {
  for_each = toset([for k, v in module.app_service : v.app_service_id])

  name                = "App Service Deleted - ${reverse(split("/", each.key))[0]}"
  resource_group_name = var.resource_group_name
  enabled             = true # var.environment == 'dev' ? false : true
  scopes              = [each.key]
  description         = "Sends an alert when the App Service is deleted"
  tags                = var.tags

  criteria {
    resource_id    = each.key
    category       = "Administrative"
    operation_name = "Microsoft.Web/sites/Delete"
  }

  action {
    action_group_id = var.action_group_low_id
  }
}
