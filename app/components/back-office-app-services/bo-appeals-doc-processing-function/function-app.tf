module "bo_appeals_doc_processing_function" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.6"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "doc-processing"
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
  service_name                             = "bo-appeals"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    # Runtime env variables
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    # Function env variables
    API_HOST                = var.back_office_api_host
    BO_BLOB_STORAGE_ACCOUNT = var.bo_appeals_storage_account_name
    BO_BLOB_CONTAINER       = var.bo_appeals_document_container
  }

  tags = var.tags
}
