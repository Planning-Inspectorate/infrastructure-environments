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

  log {
    category = "SQLSecurityAuditEvents"
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

resource "azurerm_mssql_server_extended_auditing_policy" "back_office_sql_server" {
  server_id              = azurerm_mssql_server.back_office.id
  log_monitoring_enabled = true
}

resource "azurerm_mssql_database_extended_auditing_policy" "back_office_sql_database" {
  database_id            = azurerm_mssql_database.back_office.id
  log_monitoring_enabled = true
}

resource "azurerm_log_analytics_saved_search" "sql_security_audit" {
  name                       = "SQLSecurityAuditEvents"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.back_office.id

  category     = "SQLSecurityAuditEvents"
  display_name = "SQLSecurityAuditEvents"
  query        = "AzureDiagnostics | where Category  == 'SQLSecurityAuditEvents'"

  tags = local.tags
}
