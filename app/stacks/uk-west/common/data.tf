data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "applications_service_vpn_gateway_shared_key" {
  name         = azurerm_key_vault_secret.applications_service_vpn_gateway_shared_key.name
  key_vault_id = azurerm_key_vault.environment_key_vault.id
}

data "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}
