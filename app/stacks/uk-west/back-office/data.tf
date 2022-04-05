data "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_key_vault_secret" "back_office_sql_server_password" {
  name         = "back-office-sql-server-password"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "back_office_sql_server_username" {
  name         = "back-office-sql-server-username"
  key_vault_id = var.key_vault_id
}
