resource "azurerm_key_vault_secret" "back_office_sql_server_connection_string" {
  #checkov:skip=CKV_AZURE_41

  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-server-connection-string"
  value        = local.sql_connection_string

  tags = local.tags
}
