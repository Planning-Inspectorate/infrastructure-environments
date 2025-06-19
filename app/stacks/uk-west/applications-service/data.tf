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

  provider = azurerm.tooling
}

data "azurerm_storage_account" "applications_storage_account" {
  name                = "pinssttfstateuksappserfo"
  resource_group_name = "pins-rg-shared-terraform-uks"
  provider            = azurerm.tooling
}