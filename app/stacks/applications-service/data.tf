data "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_rg

  provider = azurerm.tooling
}

data "azurerm_key_vault_secrets" "secrets" {
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "secret" {
  for_each = toset(data.azurerm_key_vault_secrets.secrets.names)

  name         = each.key
  key_vault_id = var.key_vault_id
}
