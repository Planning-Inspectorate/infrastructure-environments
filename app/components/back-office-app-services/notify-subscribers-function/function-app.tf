module "notify_subscribers_function" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "notify-subs"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.integration_subnet_id
  key_vault_id                             = var.key_vault_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "notify-subs"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    # Runtime env variables
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    # Function env variables
    NODE_ENV               = var.node_environment
    API_HOST               = var.back_office_api_host
    GOV_NOTIFY_API_KEY     = var.gov_notify_api_key
    GOV_NOTIFY_TEMPLATE_ID = var.gov_notify_template_id
    ENCRYPT_KEY            = var.encrypt_key
    FRONT_OFFICE_URL       = var.applications_front_office_web_url
    # rate limit is 3000/min, so aim for (60s/4s)*100 = 1500/min (half the limit)
    SUBSCRIPTIONS_PER_BATCH = 100
    WAIT_PER_BATCH_SECONDS  = 4
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "nsip_project_update_subscription" {
  name               = "nsip-project-update-notify-subscribers-sub" # note name must be <=50 chars
  topic_id           = var.servicebus_topic_nsip_project_update_id
  max_delivery_count = 1
}

# we only need publish messages for this function
resource "azurerm_servicebus_subscription_rule" "nsip_project_update_subscription_rule" {
  name            = "nsip-project-update-notify-subscribers-sub-rule" # note name must be <=50 chars
  subscription_id = azurerm_servicebus_subscription.nsip_project_update_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    # filter by applicationProperties
    properties = {
      type = "Publish"
    }
  }
}
