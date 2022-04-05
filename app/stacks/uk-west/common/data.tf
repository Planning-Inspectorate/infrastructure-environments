data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "applications_service_vpn_gateway_shared_key" {
  name         = azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key.name
  key_vault_id = azurerm_key_vault.environment_key_vault.id
}

data "azurerm_key_vault_secret" "sql_server_password" {
  name         = azurerm_key_vault_secret.sql_server_password.name
  key_vault_id = azurerm_key_vault.environment_key_vault.id
}

data "azurerm_key_vault_secret" "sql_server_username" {
  name         = azurerm_key_vault_secret.sql_server_username.name
  key_vault_id = azurerm_key_vault.environment_key_vault.id
}
