module "notify_subscribers_function" {
  source = "./notify-subscribers-function"

  action_group_low_id                      = var.action_group_low_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  tags                                     = var.tags
  integration_subnet_id                    = var.back_office_integration_subnet_id
  function_apps_storage_account            = var.document_check_function_storage_name
  function_apps_storage_account_access_key = var.document_check_function_storage_primary_access_key
  app_service_plan_id                      = azurerm_service_plan.back_office_functions_plan.id

  # service bus config
  service_bus_namespace_name              = var.service_bus_namespace_name
  servicebus_topic_nsip_project_update_id = var.servicebus_topic_nsip_project_update_id

  # run-time config
  back_office_api_host              = module.app_service["back_office_api"].default_site_hostname
  encrypt_key                       = local.existing_secret_refs["applications-service-encryption-secret-key"]
  gov_notify_api_key                = local.existing_secret_refs["back-office-gov-notify-api-key"]
  gov_notify_template_id            = var.notify_subscribers_function_gov_notify_template_id
  applications_front_office_web_url = var.applications_front_office_web_url

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
