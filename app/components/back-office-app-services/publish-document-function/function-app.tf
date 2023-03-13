module "publish_document_functions" {
  source = "../../../modules/node-function-app"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "doc-publisher"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  function_node_version                    = 16
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "doc-publisher"
  use_app_insights                         = true

  app_settings = {
    DOCUMENT_STORAGE_CONNECTION_STRING = var.back_office_document_storage_connection_string
    API_HOST                           = var.back_office_api_host
  }

  tags = var.tags
}
