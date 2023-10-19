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


resource "azurerm_key_vault_secret" "appeals_horizon_service_bus_key" {
  count           = var.is_dr_deployment ? 1 : 0
  name            = "appeals-horizon-pub-password"
  value           = module.app_services[0].service_bus_horizon_publish_key
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339

  tags = local.tags
}
