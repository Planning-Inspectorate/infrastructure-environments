# Appeal front office integration functions
module "front_office_subscribers" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.11"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "fo-integration"
  app_service_plan_id                      = var.integration_functions_app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.common_integration_functions_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "appeals"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
    FO_APPEALS_API                                = "${module.app_service["appeals_service_api"].default_site_hostname}/api/v1"
    FO_APPEALS_API_HOSTNAME                       = module.app_service["appeals_service_api"].default_site_hostname
  }

  tags = var.tags
}

# Appeals bo case data topic subscription
resource "azurerm_servicebus_subscription" "appeals_bo_case_topic_subscription" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  name               = "bo-appeals-case-subscription"
  topic_id           = var.service_bus_appeals_bo_case_topic_id
  max_delivery_count = 1
}

# Appeals bo document data topic subscription
resource "azurerm_servicebus_subscription" "appeals_bo_document_topic_subscription" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  name               = "bo-appeals-document-subscription"
  topic_id           = var.service_bus_appeals_bo_document_topic_id
  max_delivery_count = 1
}

# listed building topic subscription
resource "azurerm_servicebus_subscription" "listed_building_topic_subscription" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  name               = "listed-building-subscription"
  topic_id           = var.service_bus_listed_building_topic_id
  max_delivery_count = 1
}
