module "app_services" {
  source = "../../../modules/clamav-app-service"

  integration_subnet_id      = module.networking.integration_subnet_id
  location                   = azurerm_resource_group.common_infrastructure.location
  outbound_vnet_connectivity = true
  resource_group_name        = azurerm_resource_group.common_infrastructure.name
  resource_suffix            = local.resource_suffix

  tags = local.tags
}
