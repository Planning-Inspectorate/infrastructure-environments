resource "azurerm_monitor_diagnostic_setting" "key_vault_audit" {
  name                       = "audit-key-vault"
  target_resource_id         = azurerm_key_vault.environment_key_vault.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.common.id

  log {
    category = "AuditEvent"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
