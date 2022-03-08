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

resource "azurerm_subnet" "vnet_gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.common_infrastructure.name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.common_vnet_address_space.network_cidr_blocks["vnet_gateway"]]
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

resource "azurerm_private_dns_zone_virtual_network_link" "app_service" {
  name                  = "pins-vnetlink-${local.service_name}-${local.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = "privatelink.azurewebsites.net"
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  provider = azurerm.tooling
}

resource "azurerm_virtual_network_peering" "tooling" {
  name                      = "pins-peer-tooling-${local.service_name}-${local.resource_suffix}"
  remote_virtual_network_id = data.azurerm_virtual_network.tooling.id
  resource_group_name       = azurerm_virtual_network.common_infrastructure.resource_group_name
  virtual_network_name      = azurerm_virtual_network.common_infrastructure.name
}
