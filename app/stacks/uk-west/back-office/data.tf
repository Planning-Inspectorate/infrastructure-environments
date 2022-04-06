data "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_rg

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
