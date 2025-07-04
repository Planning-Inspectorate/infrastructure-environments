module "applications_command_handler_functions" {
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.49"

  action_group_ids                         = var.action_group_ids
  app_name                                 = "apps-command-handlers"
  app_service_plan_id                      = var.app_service_plan_id
  app_insights_instrument_key              = var.app_insights_instrument_key
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.integration_subnet_id
  # adding key_vault_id creates a read_secrets permission (see import)
  key_vault_id               = var.key_vault_id
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  monitoring_alerts_enabled  = var.monitoring_alerts_enabled
  outbound_vnet_connectivity = true
  resource_group_name        = var.resource_group_name
  resource_suffix            = var.resource_suffix
  service_name               = "back-office"
  function_node_version      = 20

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"
    SERVICE_BUS_HOSTNAME                          = "${var.service_bus_namespace_name}.servicebus.windows.net"
    SERVICE_BUS_TOPIC                             = var.servicebus_topic_deadline_submission_topic_name
    API_HOST                                      = var.back_office_api_host
    KEY_VAULT_URI                                 = var.key_vault_uri

    # Handle Submissions
    SERVICE_BUS_RESULT_TOPIC        = var.deadline_submissions_result_topic_name
    BLOB_STORAGE_URL                = var.back_office_storage_account_host
    BLOB_STORAGE_ACCOUNT_DOMAIN     = var.back_office_storage_account_domain
    SUBMISSIONS_BLOB_CONTAINER_NAME = var.back_office_submissions_container
    UPLOADS_BLOB_CONTAINER_NAME     = var.back_office_document_upload_container

  }

  tags = var.tags
}
