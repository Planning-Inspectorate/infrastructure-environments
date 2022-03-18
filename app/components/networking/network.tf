resource "azurerm_virtual_network" "common_infrastructure" {
  name                = "pins-vnet-${var.service_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [module.vnet_address_space.base_cidr_block]

  tags = var.tags
}

resource "azurerm_subnet" "vnet_gateway_subnet" {
  # Name if this subnet must be 'GatewaySubnet' since the VNet Gateway expects this
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["vnet_gateway"]]
}

resource "azurerm_subnet" "cosmosdb" {
  name                 = "pins-snet-cosmosdb-${var.resource_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["cosmosdb_endpoint"]]
}

resource "azurerm_subnet" "integration_subnet" {
  name                 = "pins-snet-${var.service_name}-integration-${var.resource_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["app_service_integration"]]

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

resource "azurerm_private_dns_zone_virtual_network_link" "app_service_vnet_link" {
  name                  = "pins-vnetlink-${var.service_name}-${var.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = "privatelink.azurewebsites.net"
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  tags = var.tags

  provider = azurerm.tooling
}

resource "azurerm_virtual_network_peering" "tooling" {
  name                      = "pins-peer-tooling-${var.service_name}-${var.resource_suffix}"
  remote_virtual_network_id = data.azurerm_virtual_network.tooling.id
  resource_group_name       = azurerm_virtual_network.common_infrastructure.resource_group_name
  virtual_network_name      = azurerm_virtual_network.common_infrastructure.name
}
