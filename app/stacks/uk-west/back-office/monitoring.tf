resource "azurerm_application_insights" "back_office_app_insights" {
  name                 = "pins-ai-${local.service_name}-${local.resource_suffix}-app-insights"
  location             = azurerm_resource_group.back_office_stack.location
  resource_group_name  = azurerm_resource_group.back_office_stack.name
  workspace_id         = azurerm_log_analytics_workspace.back_office.id
  application_type     = "web"
  daily_data_cap_in_gb = 10
}

resource "azurerm_log_analytics_workspace" "back_office" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "back_office_sql_database" {
  name                       = "SQLDatabaseAudit"
  target_resource_id         = azurerm_mssql_database.back_office.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.back_office.id

  enabled_log {
    category = "SQLSecurityAuditEvents"
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

resource "azurerm_mssql_server_extended_auditing_policy" "back_office_sql_server" {
  server_id              = azurerm_mssql_server.back_office.id
  log_monitoring_enabled = true
}

resource "azurerm_mssql_database_extended_auditing_policy" "back_office_sql_database" {
  database_id            = azurerm_mssql_database.back_office.id
  log_monitoring_enabled = true
}
