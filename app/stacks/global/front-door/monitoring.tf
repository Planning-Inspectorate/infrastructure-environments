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
      enabled_log,
      metric
    ]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "appeals_waf_blocks" {
  name         = "Appeals WAF blocks"
  display_name = "appeals WAF blocks"
  description  = "Triggered when there has been a WAF block for appeals service in the last 2 hours"

  location            = azurerm_resource_group.frontdoor.location
  resource_group_name = azurerm_resource_group.frontdoor.name
  scopes              = [azurerm_frontdoor.common.id]

  enabled                          = var.monitoring_alerts_enabled
  auto_mitigation_enabled          = true
  workspace_alerts_storage_enabled = false

  evaluation_frequency = "PT2H"
  window_duration      = "PT2H"

  criteria {
    query                   = <<-QUERY
      AzureDiagnostics
        | where ResourceProvider == "MICROSOFT.NETWORK" and Category == "FrontdoorWebApplicationFirewallLog"
        | where action_s == "Block"
        | where host_s == '${var.appeals_service_public_url}'
      QUERY
    time_aggregation_method = "Count"
    threshold               = 1
    operator                = "GreaterThanOrEqual"
  }

  severity = 2
}
