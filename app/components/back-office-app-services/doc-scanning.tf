module "clam_av_container" {
  source = "./clamav-container"

  count = var.feature_document_scanning_enabled ? 1 : 0

  back_office_clamav_subnet_id = var.back_office_clamav_subnet_id
  location                     = var.location
  common_resource_group_name   = var.app_service_plan_resource_group_name
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

module "document_check_function" {
  source = "./document-check-function"

  count = var.feature_document_scanning_enabled ? 1 : 0

  action_group_low_id                            = var.action_group_low_id
  location                                       = var.location
  log_analytics_workspace_id                     = var.log_analytics_workspace_id
  monitoring_alerts_enabled                      = var.monitoring_alerts_enabled
  resource_group_name                            = var.resource_group_name
  resource_suffix                                = var.resource_suffix
  tags                                           = var.tags
  service_plan_sku                               = var.service_plan_sku
  integration_subnet_id                          = var.back_office_integration_subnet_id
  clamav_host                                    = module.clam_av_container[0].clamav_host
  document_storage_back_office_documents_id      = var.document_storage_back_office_documents_id
  back_office_document_storage_connection_string = var.back_office_document_storage_connection_string

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
