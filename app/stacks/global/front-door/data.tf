data "azurerm_client_config" "current" {}

data "azurerm_key_vault_certificate" "pins_wildcard" {
  key_vault_id = var.common_key_vault_id
  name         = azurerm_key_vault_certificate.pins_wildcard.name
}
