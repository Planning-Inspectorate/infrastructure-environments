data "azurerm_client_config" "current" {}

data "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}
