data "azurerm_key_vault_certificate" "wildcard_certificate" {
  name         = "pins-wildcard"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "odw_synapse_workspace_id" {
  name         = "pins-synw-odw-id"
  key_vault_id = var.key_vault_id
}

data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "database" {
  name = "privatelink.database.windows.net"

  provider = azurerm.tooling
}
