resource "azurerm_key_vault_secret" "applications_app_insights_connection_string" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-app-insights-connection-string"
  value        = azurerm_application_insights.applications_app_insights.connection_string

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_password_admin" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-password-admin"
  value        = azurerm_mssql_server.applications_sql_server.administrator_login_password

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_password_app" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-password-app"
  value        = var.sql_server_password_app

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_username_admin" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-username-admin"
  value        = azurerm_mssql_server.applications_sql_server.administrator_login

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_username_app" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-username-app"
  value        = var.sql_server_username_app

  tags = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_connection_string_admin" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-connection-string-admin"
  value        = local.sql_connection_string_admin
  tags         = local.tags
}

resource "azurerm_key_vault_secret" "applications_sql_server_connection_string_app" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "applications-service-sql-server-connection-string-app"
  value        = local.sql_connection_string_app
  tags         = local.tags
}

resource "azurerm_key_vault_secret" "redis_cache_connection_string" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114
  key_vault_id = var.key_vault_id
  name         = "applications-service-redis-cache-connection-string"
  value        = azurerm_redis_cache.applications_service_redis_cache[count.index].primary_connection_string
}
