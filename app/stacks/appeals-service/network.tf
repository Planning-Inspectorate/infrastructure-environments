resource "azurerm_virtual_network" "appeals_service" {
  name                = "${local.prefix}-appeals-service"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "integration_subnet" {
  name                 = "${local.prefix}-appeals-integration"
  resource_group_name  = azurerm_resource_group.appeals_service_stack.name
  virtual_network_name = azurerm_virtual_network.appeals_service.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
}

resource "azurerm_subnet" "endpoint_subnet" {
  name                                           = "${local.prefix}-appeals-endpoints"
  resource_group_name                            = azurerm_resource_group.appeals_service_stack.name
  virtual_network_name                           = azurerm_virtual_network.appeals_service.name
  address_prefixes                               = ["10.0.2.0/24"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_private_dns_zone" "private_link" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link" {
  name                  = "${local.prefix}-privatelink"
  resource_group_name   = azurerm_resource_group.appeals_service_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.private_link.name
  virtual_network_id    = azurerm_virtual_network.appeals_service.id
}
