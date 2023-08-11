module "odw_subscriber_function" {

  source = "git@github.com:Planning-Inspectorate/infrastructure-modules.git//node-function-app?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "odw-subscriber"
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
  service_name                             = "odw-subscriber"
  use_app_insights                         = true

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "employee_topic_subscription" {
  name               = "employee-topic-subscription"
  topic_id           = var.employee_topic_id
  max_delivery_count = 1
}
