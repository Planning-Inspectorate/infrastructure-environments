data "azurerm_private_dns_zone" "app_service" {
  name = "privatelink.azurewebsites.net"

  provider = azurerm.tooling
}

data "azurerm_private_dns_zone" "cosmosdb" {
  name = "privatelink.mongo.cosmos.azure.com"

  provider = azurerm.tooling
}
