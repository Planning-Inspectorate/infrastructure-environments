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

data "azurerm_private_dns_zone" "cosmosdb" {
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "app_service" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "cognitive" {
  name                = "privatelink.cognitiveservices.azure.com"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "sql_server" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "redis" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "service_bus" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "sql_synapse" {
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "internal" {
  name                = var.internal_dns_name
  resource_group_name = var.tooling_network_rg

  provider = azurerm.tooling
}
