# resource "azurerm_storage_account" "sql_audit" {
#   #TODO: Customer Managed Keys
#   #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
#   #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
#   #TODO: Logging
#   #checkov:skip=CKV_AZURE_33: Logging not implemented yet
#   #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
#   #TODO: Access restrictions
#   #checkov:skip=CKV_AZURE_35: Network access restrictions

#   name                            = replace("pinsstsqlaudit${local.resource_suffix}", "-", "")
#   resource_group_name             = azurerm_resource_group.back_office_stack.name
#   location                        = azurerm_resource_group.back_office_stack.location
#   account_tier                    = "Standard"
#   account_replication_type        = "GRS"
#   allow_nested_items_to_be_public = false
#   enable_https_traffic_only       = true
#   min_tls_version                 = "TLS1_2"

#   tags = local.tags
# }

resource "azurerm_log_analytics_workspace" "back_office" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 7

  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "back_office_sql_server" {
  name                       = "SQLServerSecurity"
  target_resource_id         = azurerm_mssql_server.back_office.id
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
  retention_in_days      = 7

  # storage_endpoint                        = azurerm_storage_account.sql_audit.primary_blob_endpoint
  # storage_account_access_key              = azurerm_storage_account.sql_audit.primary_access_key
  # storage_account_access_key_is_secondary = false
}
