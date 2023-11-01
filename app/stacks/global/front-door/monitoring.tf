resource "azurerm_monitor_diagnostic_setting" "front_door_waf" {
  name                       = "WebApplicationFirewall"
  target_resource_id         = azurerm_frontdoor.common.id
  log_analytics_workspace_id = var.common_log_analytics_workspace_id

  enabled_log {
    category = "FrontdoorWebApplicationFirewallLog"
  }

  metric {
    category = "AllMetrics"
  }

  lifecycle {
    ignore_changes = [
      log,
      metric
    ]
  }
}
