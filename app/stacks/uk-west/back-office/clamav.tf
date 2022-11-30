module "clamav_app_service" {
  source = "../../../modules/clamav-app-service"

  endpoint_subnet_id         = azurerm_subnet.back_office_ingress.id
  inbound_vnet_connectivity  = true
  integration_subnet_id      = var.back_office_integration_subnet_id
  location                   = azurerm_resource_group.back_office_stack.location
  outbound_vnet_connectivity = true
  resource_group_name        = azurerm_resource_group.back_office_stack.name
  resource_suffix            = local.resource_suffix

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
