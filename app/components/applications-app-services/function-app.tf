module "service_bus_trigger_function" {
  source = "../../modules/node-function-app"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "sb-trigger"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_storage_name
  function_apps_storage_account_access_key = var.function_storage_primary_access_key
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "applications-service"
  use_app_insights                         = true

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "nsip_project_topic_subscription" {
  name               = "nsip-project-subscription"
  topic_id           = var.back_office_service_bus_nsip_project_topic_id
  max_delivery_count = 1
}

resource "azurerm_role_assignment" "nsip_service_bus_role" {
  scope                = azurerm_servicebus_subscription.nsip_project_topic_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.service_bus_trigger_function.principal_id
}
