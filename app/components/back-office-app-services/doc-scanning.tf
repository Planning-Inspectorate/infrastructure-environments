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

module "document_check_function" {
  source = "./document-check-function"

  count = var.feature_document_scanning_enabled ? 1 : 0

  action_group_low_id                                                                 = var.action_group_low_id
  location                                                                            = var.location
  log_analytics_workspace_id                                                          = var.log_analytics_workspace_id
  monitoring_alerts_enabled                                                           = var.monitoring_alerts_enabled
  resource_group_name                                                                 = var.resource_group_name
  resource_suffix                                                                     = var.resource_suffix
  tags                                                                                = var.tags
  integration_subnet_id                                                               = var.back_office_integration_subnet_id
  clamav_host                                                                         = module.clam_av_container[0].clamav_host
  back_office_api_host                                                                = module.app_service["back_office_api"].default_site_hostname
  back_office_document_api_host                                                       = module.app_service["back_office_document_storage_api"].default_site_hostname
  function_apps_storage_account                                                       = var.document_check_function_storage_name
  function_apps_storage_account_access_key                                            = var.document_check_function_storage_primary_access_key
  app_service_plan_id                                                                 = azurerm_service_plan.back_office_functions_plan.id
  document_storage_back_office_document_service_uploads_container_resource_manager_id = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  document_storage_back_office_document_service_uploads_container_name                = var.document_storage_back_office_document_service_uploads_container_name
  back_office_documents_system_topic_name                                             = var.back_office_documents_system_topic_name

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
