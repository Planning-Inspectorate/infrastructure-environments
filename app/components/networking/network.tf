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
  count = var.cosmosdb_enable_public_access ? 0 : 1

  name                                      = "pins-snet-${var.service_name}-cosmosdb-${var.resource_suffix}"
  resource_group_name                       = var.resource_group_name
  virtual_network_name                      = azurerm_virtual_network.common_infrastructure.name
  address_prefixes                          = [module.vnet_address_space.network_cidr_blocks["cosmosdb_endpoint"]]
  private_endpoint_network_policies_enabled = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "cosmosdb_vnet_link" {
  count = var.cosmosdb_enable_public_access ? 0 : 1

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

resource "azurerm_subnet" "back_office_integration_subnet" {
  name                 = "pins-snet-back-office-${var.service_name}-integration-${var.resource_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["back_office_app_service_integration"]]

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

resource "azurerm_subnet" "common_integration_functions_subnet" {
  name                 = "pins-common-integration-functions-${var.resource_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["common_integration_functions_app_service_integration"]]

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

resource "azurerm_subnet" "back_office_clamav" {
  name                 = "pins-snet-${var.service_name}-clam-av-${var.resource_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.common_infrastructure.name
  address_prefixes     = [module.vnet_address_space.network_cidr_blocks["back_office_clamav"]]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
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

resource "azurerm_private_dns_zone_virtual_network_link" "back_office_sql_server" {
  name                  = "pins-vnetlink-${var.service_name}-sql-server-${var.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = "privatelink.database.windows.net"
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  tags = var.tags

  provider = azurerm.tooling
}

resource "azurerm_private_dns_zone_virtual_network_link" "internal" {
  name                  = "pins-vnetlink-${var.service_name}-internal-${var.resource_suffix}"
  resource_group_name   = var.tooling_network_rg
  private_dns_zone_name = var.internal_dns_name
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id

  tags = var.tags

  provider = azurerm.tooling
}

# Private DNS zone is different for namespaces going forward - we create one in each common group per environment, not just one cross-env one in tooling
resource "azurerm_private_dns_zone" "sql_synase_dns_zone" { # typo in name left here to avoid delete + create
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_synapse_vnet_link" {
  name                  = "pins-vnetlink-${var.service_name}-synapse-sql-${var.resource_suffix}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_synase_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.common_infrastructure.id
}

resource "azurerm_virtual_network_peering" "env_to_tooling" {
  name                      = "pins-peer-env-to-tooling-${var.service_name}-${var.resource_suffix}"
  remote_virtual_network_id = data.azurerm_virtual_network.tooling.id
  resource_group_name       = azurerm_virtual_network.common_infrastructure.resource_group_name
  virtual_network_name      = azurerm_virtual_network.common_infrastructure.name
}

resource "azurerm_virtual_network_peering" "tooling_to_env" {
  name                      = "pins-peer-tooling-to-${var.environment}-${var.env_network_region_short}-shared-tooling-${var.tooling_network_region_short}"
  remote_virtual_network_id = azurerm_virtual_network.common_infrastructure.id
  resource_group_name       = var.tooling_network_rg
  virtual_network_name      = var.tooling_network_name

  provider = azurerm.tooling
}
