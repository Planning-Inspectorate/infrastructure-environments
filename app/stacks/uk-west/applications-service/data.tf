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

data "azurerm_monitor_action_group" "fo_applications_tech" {
  resource_group_name = var.common_resource_group_name
  name                = var.action_group_names.applications-fo-tech
}
