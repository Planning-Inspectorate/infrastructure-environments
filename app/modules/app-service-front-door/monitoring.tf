resource "azurerm_monitor_diagnostic_setting" "front_door_waf" {
  count = var.environment == "dev" ? 1 : 0

  name                       = var.name
  target_resource_id         = azurerm_cdn_frontdoor_profile.default[count.index].id
  log_analytics_workspace_id = var.common_log_analytics_workspace_id

  enabled_log {
    category = "FrontdoorWebApplicationFirewallLog"
  }

  metric {
    category = "AllMetrics"
  }

  lifecycle {
    ignore_changes = [
      enabled_log,
      metric
    ]
  }
}
