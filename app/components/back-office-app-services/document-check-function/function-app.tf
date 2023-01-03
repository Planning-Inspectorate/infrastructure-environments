module "anti_virus_functions" {
  source = "../../../modules/node-function-app"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "doc-check"
  app_service_plan_id                      = azurerm_service_plan.clamav_service_plan.id
  function_apps_storage_account            = azurerm_storage_account.document_check_function.name
  function_apps_storage_account_access_key = azurerm_storage_account.document_check_function.primary_access_key
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "doc-check"

  app_settings = {
    CLAM_AV_HOST = var.clamav_host
    CLAM_AV_PORT = "3310"
  }

  tags = var.tags
}
