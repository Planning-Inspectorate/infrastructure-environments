resource "azurerm_log_analytics_workspace" "back_office" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

resource "azurerm_mssql_server_extended_auditing_policy" "back_office_sql_server" {
  enabled                = var.monitoring_alerts_enabled
  storage_endpoint       = azurerm_storage_account.back_office_sql_server.primary_blob_endpoint
  server_id              = azurerm_mssql_server.back_office.id
  retention_in_days      = var.sql_database_configuration["audit_retention_days"]
  log_monitoring_enabled = false

  depends_on = [
    azurerm_role_assignment.back_office_sql_server,
    azurerm_storage_account.back_office_sql_server,
  ]
}

resource "azurerm_mssql_server_security_alert_policy" "back_office_sql_server" {
  state                      = var.monitoring_alerts_enabled ? "Enabled" : "Disabled"
  resource_group_name        = azurerm_resource_group.back_office_stack.name
  server_name                = azurerm_mssql_server.back_office.name
  storage_endpoint           = azurerm_storage_account.back_office_sql_server.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.back_office_sql_server.primary_access_key
  retention_days             = var.sql_database_configuration["audit_retention_days"]
  email_account_admins       = true
  email_addresses            = var.alert_recipients["low"]
}

resource "azurerm_mssql_server_vulnerability_assessment" "back_office_sql_server" {
  #checkov:skip=CKV2_AZURE_3: scans enabled by env
  #checkov:skip=CKV2_AZURE_4: false positive?
  #checkov:skip=CKV2_AZURE_5: false positive?

  count                           = var.monitoring_alerts_enabled ? 1 : 0
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.back_office_sql_server.id
  storage_container_path          = "${azurerm_storage_account.back_office_sql_server.primary_blob_endpoint}${azurerm_storage_container.back_office_sql_server.name}/"
  storage_account_access_key      = azurerm_storage_account.back_office_sql_server.primary_access_key

  recurring_scans {
    enabled                   = var.monitoring_alerts_enabled
    email_subscription_admins = true
    emails                    = var.alert_recipients["low"]
  }
}
