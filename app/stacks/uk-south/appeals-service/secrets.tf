resource "time_offset" "secret_expire_date" {
  offset_years = 5
}

resource "azurerm_key_vault_secret" "appeals_app_config_endpoint_kv_secret" {
  count           = var.is_dr_deployment ? 1 : 0
  name            = "appeals-app-config-connection-string"
  value           = azurerm_app_configuration.appeals_service[count.index].primary_write_key[0].connection_string
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_insights_connection_kv_secret" {
  count           = var.is_dr_deployment ? 1 : 0
  name            = "appeals-app-insights-connection-string"
  value           = azurerm_application_insights.web_app_insights.connection_string
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_mongo_db_connection_secret" {
  count           = var.is_dr_deployment ? 1 : 0
  name            = "appeals-mongo-db-connection-string"
  value           = var.cosmosdb_connection_string
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_documents_primary_blob_connection_string" {
  count           = var.is_dr_deployment ? 1 : 0
  name            = "appeals-documents-primary-blob-connection-string"
  value           = var.appeal_documents_primary_blob_connection_string
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_password_admin" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-service-sql-server-password-admin"
  value        = azurerm_mssql_server.appeals_sql_server.administrator_login_password

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_password_app" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-service-sql-server-password-app"
  value        = var.sql_server_password_app

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_username_admin" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-service-sql-server-username-admin"
  value        = azurerm_mssql_server.appeals_sql_server.administrator_login

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_username_app" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-service-sql-server-username-app"
  value        = var.sql_server_username_app

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_connection_string_admin" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-sql-server-connection-string-admin"
  value        = local.sql_connection_string_admin

  tags = local.tags
}

resource "azurerm_key_vault_secret" "appeals_sql_server_connection_string_app" {
  #checkov:skip=CKV_AZURE_41
  count        = var.is_dr_deployment ? 1 : 0
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "appeals-sql-server-connection-string-app"
  value        = local.sql_connection_string_app

  tags = local.tags
}
