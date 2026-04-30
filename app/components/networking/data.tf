data "azurerm_virtual_network" "tooling" {
  name                = var.tooling_network_name
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}
