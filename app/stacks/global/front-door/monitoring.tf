resource "azurerm_monitor_diagnostic_setting" "front_door_waf" {
  name                       = "WebApplicationFirewall"
  target_resource_id         = azurerm_frontdoor.common.id
  log_analytics_workspace_id = var.common_log_analytics_workspace_id

  enabled_log {
    category = "FrontdoorWebApplicationFirewallLog"

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

resource "azurerm_monitor_diagnostic_setting" "front_door_premium_waf" {
  name                       = "WebApplicationFirewall"
  target_resource_id         = azurerm_cdn_frontdoor_profile.common.id
  log_analytics_workspace_id = var.common_log_analytics_workspace_id

  enabled_log {
    category = "FrontdoorWebApplicationFirewallLog"

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
