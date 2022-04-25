resource "azurerm_monitor_diagnostic_setting" "front_door_waf" {
  name                       = "WebApplicationFirewall"
  target_resource_id         = azurerm_frontdoor.common.id
  log_analytics_workspace_id = var.common_log_analytics_workspace_id

  log {
    category = "FrontdoorWebApplicationFirewallLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }

  lifecycle {
    ignore_changes = [
      log,
      metric
    ]
  }
}
