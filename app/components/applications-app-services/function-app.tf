module "back_office_subscribers" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  source = "../../modules/node-function-app"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "bo-subscribers"
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
  function_node_version                    = 16

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
    SqlConnectionString                           = var.applications_sql_server_connection_string
  }

  tags = var.tags
}

# nsip-project

resource "azurerm_servicebus_subscription" "nsip_project_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name               = "applications-nsip-project-subscription"
  topic_id           = var.back_office_service_bus_nsip_project_topic_id
  max_delivery_count = 1
}

resource "azurerm_role_assignment" "nsip_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

resource "azurerm_servicebus_subscription_rule" "nsip_project_topic_subscription_rule" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name            = "applications-nsip-project-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_project_topic_subscription[0].id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type = "Publish"
    }
  }
}

# nsip-documents

resource "azurerm_servicebus_subscription" "nsip_documents_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name               = "applications-nsip-documents-subscription"
  topic_id           = var.back_office_service_bus_nsip_documents_topic_id
  max_delivery_count = 1
}

resource "azurerm_role_assignment" "nsip_documents_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_documents_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}

# nsip-project-update

resource "azurerm_servicebus_subscription" "nsip_project_update_topic_subscription" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  name               = "applications-nsip-project-update-subscription"
  topic_id           = var.back_office_service_bus_nsip_project_update_topic_id
  max_delivery_count = 1
}

resource "azurerm_role_assignment" "nsip_project_update_service_bus_role" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.nsip_project_update_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.back_office_subscribers[0].principal_id
}
