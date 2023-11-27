module "networking" {
  source = "../../../components/networking"

  base_cidr_block                             = var.secondary_vnet_address_space
  cosmosdb_enable_public_access               = var.cosmosdb_enable_public_access
  deploy_national_infrastructure_vnet_gateway = var.is_dr_deployment
  env_network_region_short                    = module.azure_region_uks.location_short
  environment                                 = var.environment
  location                                    = azurerm_resource_group.common_infrastructure.location
  resource_group_name                         = azurerm_resource_group.common_infrastructure.name
  resource_suffix                             = local.resource_suffix
  service_name                                = local.service_name
  tooling_network_name                        = var.tooling_network_name
  tooling_network_region_short                = var.tooling_network_region_short
  tooling_network_rg                          = var.tooling_network_rg

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
