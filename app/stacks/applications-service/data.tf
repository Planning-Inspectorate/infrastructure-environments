data "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_rg

  provider = azurerm.tooling
}

data "azurerm_key_vault" "environment_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.common_resource_group_name
}

data "azurerm_key_vault_secret" "vnet_gateway_shared_key" {
  name         = "applications-service-vpn-gateway-shared-key"
  key_vault_id = data.azurerm_key_vault.environment_key_vault.id
}
