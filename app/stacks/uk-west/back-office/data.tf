data "azurerm_client_config" "current" {}

data "azurerm_private_dns_zone" "app_config" {
  name = "privatelink.azconfig.io"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "cognitive" {
  name = "privatelink.cognitiveservices.azure.com"

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

data "azurerm_private_dns_zone" "service_bus" {
  name = "privatelink.servicebus.windows.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "sql_synapse" {
  name = "privatelink.sql.azuresynapse.net"

  provider = azurerm.tooling
}

data "azurerm_monitor_action_group" "bo_applications_tech" {
  resource_group_name = var.common_resource_group_name
  name                = var.action_group_names.bo_applications_tech
}
