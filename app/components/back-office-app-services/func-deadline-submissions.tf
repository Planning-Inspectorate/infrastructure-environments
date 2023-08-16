module "deadline_submissions_function" {
  source = "./deadline-submissions-function"

  action_group_low_id                                  = var.action_group_low_id
  location                                             = var.location
  log_analytics_workspace_id                           = var.log_analytics_workspace_id
  monitoring_alerts_enabled                            = var.monitoring_alerts_enabled
  resource_group_name                                  = var.resource_group_name
  resource_suffix                                      = var.resource_suffix
  tags                                                 = var.tags
  integration_subnet_id                                = var.back_office_integration_subnet_id
  back_office_api_host                                 = module.app_service["back_office_api"].default_site_hostname
  function_apps_storage_account                        = var.document_check_function_storage_name
  function_apps_storage_account_access_key             = var.document_check_function_storage_primary_access_key
  servicebus_topic_deadline_submission_subscription_id = var.servicebus_topic_deadline_submission_subscription_id
  service_bus_namespace_name                           = var.service_bus_namespace_name
  back_office_storage_account_host                     = var.document_storage_api_host
  app_service_plan_id                                  = azurerm_service_plan.back_office_functions_plan.id
  deadline_submissions_topic_name                      = var.deadline_submissions_topic_name

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
