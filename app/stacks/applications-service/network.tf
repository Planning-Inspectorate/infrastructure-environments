resource "azurerm_virtual_network" "applications_service" {
  name                = "pins-vnet-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.applications_service_stack.location
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "integration_subnet" {
  name                 = "pins-snet-${local.service_name}-integration-${local.resource_suffix}"
  resource_group_name  = azurerm_resource_group.applications_service_stack.name
  virtual_network_name = azurerm_virtual_network.applications_service.name
  address_prefixes     = ["10.1.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

resource "azurerm_subnet" "endpoint_subnet" {
  name                                           = "pins-snet-${local.service_name}-endpoint-${local.resource_suffix}"
  resource_group_name                            = azurerm_resource_group.applications_service_stack.name
  virtual_network_name                           = azurerm_virtual_network.applications_service.name
  address_prefixes                               = ["10.1.2.0/24"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_private_dns_zone" "private_link" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link" {
  name                  = "pins-vnetlink-${local.service_name}-${local.resource_suffix}"
  resource_group_name   = azurerm_resource_group.applications_service_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.private_link.name
  virtual_network_id    = azurerm_virtual_network.applications_service.id
}
