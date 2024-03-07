module "bo_appeals_user_import_function" {
  source = "./bo-appeals-userdata-import-function"

  action_group_ids                         = local.bo_appeals_action_group_ids
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  tags                                     = var.tags
  back_office_api_host                     = module.app_service["back_office_appeals_api"].default_site_hostname
  function_apps_storage_account            = var.document_check_function_storage_name
  function_apps_storage_account_access_key = var.document_check_function_storage_primary_access_key
  app_service_plan_id                      = azurerm_service_plan.back_office_functions_plan.id
  integration_subnet_id                    = var.back_office_integration_subnet_id
  service_bus_namespace_name               = var.service_bus_namespace_name
  serviceuser_topic_id                     = var.service_user_topic_id
  service_bus_config                       = var.service_bus_config

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
