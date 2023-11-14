module "anti_virus_functions" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "doc-check"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "doc-check"
  use_app_insights                         = true
  # For some reason, the node-clam library only works with Node 14. We'll need to fix this before go-live: BOAS-1114
  function_node_version = 14

  app_settings = {
    CLAM_AV_HOST              = var.clamav_host
    CLAM_AV_PORT              = "3310"
    API_HOST                  = var.back_office_api_host
    SERVICE_BUS_HOST          = "${var.service_bus_namespace_name}.servicebus.windows.net"
    SERVICE_BUS_TOPIC         = var.deadline_submissions_topic_name
    EXCLUDED_STORAGE_ACCOUNTS = jsonencode([var.document_storage_account_name])
  }

  tags = var.tags
}
