module "clamav_container" {
  source = "../../../modules/clamav-container-instance"

  common_vnet_cidr_blocks = var.common_vnet_cidr_blocks
  common_vnet_name        = var.common_vnet_name
  location                = azurerm_resource_group.back_office_stack.location
  resource_group_name     = azurerm_resource_group.back_office_stack.name
  resource_suffix         = local.resource_suffix
  service_name            = "back-office-clam-av"

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
