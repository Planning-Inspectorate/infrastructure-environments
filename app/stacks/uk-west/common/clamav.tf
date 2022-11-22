module "app_services" {
  source = "../../../modules/clamav-app-service"

  endpoint_subnet_id         = module.networking.integration_subnet_id
  inbound_vnet_connectivity  = true
  integration_subnet_id      = module.networking.integration_subnet_id
  location                   = azurerm_resource_group.common_infrastructure.location
  outbound_vnet_connectivity = true
  resource_group_name        = azurerm_resource_group.common_infrastructure.name
  resource_suffix            = local.resource_suffix

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
