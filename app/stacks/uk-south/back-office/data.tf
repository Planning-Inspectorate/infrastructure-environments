data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "database" {
  name = "privatelink.database.windows.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "redis_cache" {
  name = "privatelink.redis.cache.windows.net"
  # this might get moved one day but exists in the application stack for now
  resource_group_name = "pins-rg-applications-service-${local.resource_suffix}"
}
