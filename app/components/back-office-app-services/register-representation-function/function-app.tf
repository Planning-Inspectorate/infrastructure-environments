module "register_representation_function" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.11"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "register-representation"
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
  service_name                             = "bo-apps"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    SERVICE_BUS_HOSTNAME                          = "${var.service_bus_namespace_name}.servicebus.windows.net"
    SERVICE_BUS_TOPIC                             = var.register_representation_topic_name
    API_HOST                                      = var.back_office_api_host
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "register_representation_subscription" {
  name               = "register-representation-subscription"
  topic_id           = var.servicebus_topic_register_representation_id
  max_delivery_count = 1
}
