resource "azurerm_key_vault_secret" "app_secret" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  for_each = toset(module.app_services.secret_names)

  key_vault_id = var.key_vault_id
  name         = each.value
  value        = "<enter_value>"

  tags = local.tags

  lifecycle {
    ignore_changes = [
      value,
      version
    ]
  }
}

resource "azurerm_key_vault_secret" "redis_cache_connection_string" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114
  key_vault_id = var.key_vault_id
  name         = "applications-service-redis-cache-connection-string"
  value        = azurerm_redis_cache.applications_service_redis_cache.primary_connection_string
}

# resource "azurerm_key_vault_secret" "applications_sql_server_password" {
#   #checkov:skip=CKV_AZURE_41

#   content_type = "text/plain"
#   key_vault_id = var.key_vault_id
#   name         = "applications-service-sql-server-password"
#   value        = azurerm_mssql_server.applications_sql_server.administrator_login_password

#   tags = local.tags
# }

# resource "azurerm_key_vault_secret" "applications_sql_server_username" {
#   #checkov:skip=CKV_AZURE_41

#   content_type = "text/plain"
#   key_vault_id = var.key_vault_id
#   name         = "applications-service-sql-server-username"
#   value        = azurerm_mssql_server.applications_sql_server.administrator_login

#   tags = local.tags
# }

# resource "azurerm_key_vault_secret" "applications_sql_server_connection_string" {
#   #checkov:skip=CKV_AZURE_41

#   content_type = "text/plain"
#   key_vault_id = var.key_vault_id
#   name         = "applications-service-sql-server-connection-string"
#   value        = local.sql_connection_string

#   tags = local.tags
# }
