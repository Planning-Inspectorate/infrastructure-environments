data "azurerm_private_dns_zone" "app_config" {
  name = "privatelink.azconfig.io"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "database" {
  name = "privatelink.database.windows.net"

  provider = azurerm.tooling
}

data "azurerm_monitor_action_group" "tech" {
  resource_group_name = var.common_resource_group_name_ukw
  name                = var.action_group_names.tech
}

data "azurerm_virtual_network" "staging_afo_vnet" {
  count               = var.environment == "staging" ? 1 : 0
  name                = var.appeals_vnet_staging.fo_network_name
  resource_group_name = var.appeals_vnet_staging.fo_rg
}
