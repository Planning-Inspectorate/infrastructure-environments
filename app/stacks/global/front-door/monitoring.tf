resource "azurerm_log_analytics_workspace" "front_door" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  location            = azurerm_resource_group.frontdoor.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "front_door_waf" {
  name                       = "WebApplicationFirewall"
  target_resource_id         = azurerm_frontdoor.common.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.front_door.id

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
