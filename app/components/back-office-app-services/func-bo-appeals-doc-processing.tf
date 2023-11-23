module "bo_appeals_doc_processing_function" {
  source = "./bo-appeals-doc-processing-function"

  action_group_low_id                      = var.action_group_low_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  tags                                     = var.tags
  integration_subnet_id                    = var.back_office_integration_subnet_id
  function_apps_storage_account            = var.document_check_function_storage_name
  function_apps_storage_account_access_key = var.document_check_function_storage_primary_access_key
  back_office_api_host                     = module.app_service["back_office_api"].default_site_hostname
  app_service_plan_id                      = azurerm_service_plan.back_office_functions_plan.id
  service_bus_namespace_name               = var.service_bus_namespace_name
  malware_scanning_topic_id                = var.malware_scanning_topic_id
  front_office_storage_account_id          = var.front_office_storage_account_id
  back_office_storage_account_host         = var.back_office_storage_account_host
  back_office_appeals_document_container   = var.back_office_storage_container


  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
