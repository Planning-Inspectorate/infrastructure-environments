resource "azurerm_virtual_network" "common_infrastructure" {
  name                = "pins-vnet-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  address_space       = [module.common_vnet_address_space.base_cidr_block]
}

resource "azurerm_subnet" "app_gateway_subnet" {
  name                 = "pins-snet-${local.service_name}-agw-${local.resource_suffix}"
  resource_group_name  = azurerm_resource_group.common_infrastructure.name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.common_vnet_address_space.network_cidr_blocks["app_gateway"]]
}

resource "azurerm_subnet" "vpn_gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.common_infrastructure.name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.common_vnet_address_space.network_cidr_blocks["vpn_gateway"]]
}

resource "azurerm_subnet" "integration_subnet" {
  name                 = "pins-snet-${local.service_name}-integration-${local.resource_suffix}"
  resource_group_name  = azurerm_resource_group.common_infrastructure.name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.common_vnet_address_space.network_cidr_blocks["app_service_integration"]]

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

resource "azurerm_private_dns_zone" "private_link" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link" {
  name                  = "pins-vnetlink-${local.service_name}-${local.resource_suffix}"
  resource_group_name   = azurerm_resource_group.common_infrastructure.name
  private_dns_zone_name = azurerm_private_dns_zone.private_link.name
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id
}
