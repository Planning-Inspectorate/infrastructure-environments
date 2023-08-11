module "handle_subscriptions_function" {

  source = "git::ssh://git@github.com/Planning-Inspectorate/infrastructure-modules//node-function-app.git?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "handle-subs"
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
  service_name                             = "handle-subs"
  use_app_insights                         = true

  app_settings = {
    # Runtime env variables
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    # Function env variables
    API_HOST = var.back_office_api_host
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "register_nsip_subscription_subscription" {
  name               = "register-nsip-subscription-subscription"
  topic_id           = var.servicebus_topic_register_nsip_subscription_id
  max_delivery_count = 1
}
