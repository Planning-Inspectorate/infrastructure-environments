module "networking" {
  source = "../../../components/networking"

  base_cidr_block                             = var.primary_vnet_address_space
  deploy_national_infrastructure_vnet_gateway = true
  location                                    = azurerm_resource_group.common_infrastructure.location
  resource_group_name                         = azurerm_resource_group.common_infrastructure.name
  resource_suffix                             = local.resource_suffix
  service_name                                = local.service_name
  tooling_network_name                        = var.tooling_network_name
  tooling_network_rg                          = var.tooling_network_rg
  tooling_subscription_id                     = var.tooling_subscription_id

  tags = local.tags
}
