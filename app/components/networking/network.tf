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
  name                                           = "pins-snet-${var.service_name}-cosmosdb-${var.resource_suffix}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.common_infrastructure.name
  address_prefixes                               = [module.vnet_address_space.network_cidr_blocks["cosmosdb_endpoint"]]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "cosmosdb_vnet_link" {
  name                  = "pins-vnetlink-${var.service_name}-cosmosdb-${var.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = "privatelink.mongo.cosmos.azure.com"
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  tags = var.tags

  provider = azurerm.tooling
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
  name                  = "pins-vnetlink-${var.service_name}-app-service-${var.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = "privatelink.azurewebsites.net"
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  tags = var.tags

  provider = azurerm.tooling
}

resource "azurerm_virtual_network_peering" "env_to_tooling" {
  name                      = "pins-peer-env-to-tooling-${var.service_name}-${var.resource_suffix}"
  remote_virtual_network_id = data.azurerm_virtual_network.tooling.id
  resource_group_name       = azurerm_virtual_network.common_infrastructure.resource_group_name
  virtual_network_name      = azurerm_virtual_network.common_infrastructure.name
}

resource "azurerm_virtual_network_peering" "tooling_to_env" {
  name                      = "pins-peer-tooling-to-env-shared-tooling-${var.tooling_network_region_short}"
  remote_virtual_network_id = azurerm_virtual_network.common_infrastructure.id
  resource_group_name       = var.tooling_network_rg
  virtual_network_name      = var.tooling_network_name

  provider = azurerm.tooling
}
