# TODO: Move this to Appeals Front Office
module "clam_av_container" {
  source = "./clamav-container"

  count = var.feature_document_scanning_enabled ? 1 : 0

  back_office_clamav_subnet_id = var.back_office_clamav_subnet_id
  location                     = var.location
  resource_group_name          = var.resource_group_name
  resource_suffix              = var.resource_suffix
  tags                         = var.tags
  common_vnet_id               = var.common_vnet_id
  environment                  = var.environment

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
