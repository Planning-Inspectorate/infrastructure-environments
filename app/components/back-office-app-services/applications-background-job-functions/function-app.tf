module "applications_background_job_functions" {
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.33"

  action_group_ids                         = var.action_group_ids
  app_name                                 = "apps-background-jobs"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  function_node_version                    = 20
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
  use_app_insights           = true

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = "${var.service_bus_namespace_name}.servicebus.windows.net"

    # Malware Detection
    API_HOST = var.back_office_api_host

    # Notify Subscribers
    NODE_ENV                     = var.node_environment
    API_HOST                     = var.back_office_api_host
    GOV_NOTIFY_API_KEY           = var.gov_notify_api_key
    GOV_NOTIFY_TEMPLATE_ID       = var.gov_notify_template_id
    GOV_NOTIFY_TEMPLATE_WELSH_ID = var.gov_notify_template_welsh_id
    ENCRYPT_KEY                  = var.encrypt_key
    FRONT_OFFICE_URL             = var.applications_front_office_web_url
    KEY_VAULT_URI                = var.key_vault_uri
    SUBSCRIPTIONS_PER_BATCH      = 100
    WAIT_PER_BATCH_SECONDS       = 4

    # Publish Documents
    BLOB_STORAGE_ACCOUNT_HOST   = var.back_office_storage_account_host
    BLOB_STORAGE_ACCOUNT_DOMAIN = var.back_office_storage_account_domain
    BLOB_SOURCE_CONTAINER       = var.back_office_document_upload_container
    BLOB_PUBLISH_CONTAINER      = var.back_office_file_publish_container
  }

  tags = var.tags
}
