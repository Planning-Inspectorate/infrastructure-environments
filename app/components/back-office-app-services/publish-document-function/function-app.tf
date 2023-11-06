module "publish_document_functions" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "doc-publisher"
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
  service_name                             = "doc-publisher"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    # Runtime env variables
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    # Function env variables
    API_HOST                  = var.back_office_api_host
    BLOB_STORAGE_ACCOUNT_HOST = var.back_office_storage_account_host
    BLOB_SOURCE_CONTAINER     = var.back_office_document_upload_container
    BLOB_PUBLISH_CONTAINER    = var.back_office_file_publish_container
  }

  tags = var.tags
}

resource "azurerm_servicebus_subscription" "nsip_document_published_subscription" {
  name               = "nsip-document-updated-publishing"
  topic_id           = var.servicebus_topic_nsip_documents_id
  max_delivery_count = 1
}

# Since the document is locked for editing after being set to 'publishing', and then finally updated to 'published', this should only trigger one publish
# Regardless, publishing is an idempotent operation so duplicate messages won't matter.
resource "azurerm_servicebus_subscription_rule" "nsip_document_pub_subscription_rule" {
  name            = "back-office-nsip-document-pub-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_document_published_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type       = "Update"
      publishing = true
    }
  }
}

resource "azurerm_servicebus_subscription" "nsip_document_unpublished_subscription" {
  name               = "nsip-document-updated-unpublishing"
  topic_id           = var.servicebus_topic_nsip_documents_id
  max_delivery_count = 1
}

resource "azurerm_servicebus_subscription_rule" "nsip_document_unpub_subscription_rule" {
  name            = "back-office-nsip-document-unpub-subscription-rule"
  subscription_id = azurerm_servicebus_subscription.nsip_document_unpublished_subscription.id
  filter_type     = "CorrelationFilter"
  correlation_filter {
    properties = {
      type         = "Update"
      unpublishing = true
    }
  }
}
