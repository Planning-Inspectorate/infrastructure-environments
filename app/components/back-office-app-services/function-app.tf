module "anti_virus_functions" {
  source = "../../modules/node-function-app"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "document-check-function"
  app_service_plan_id                      = var.clamav_app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.back_office_integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = var.service_name

  app_settings = {}
  tags         = var.tags
}
