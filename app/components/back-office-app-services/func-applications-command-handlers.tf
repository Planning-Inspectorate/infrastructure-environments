module "applications_command_handler_functions" {
  source = "./applications-command-handler-functions"

  action_group_ids                                           = local.bo_applications_action_group_ids
  location                                                   = var.location
  log_analytics_workspace_id                                 = var.log_analytics_workspace_id
  monitoring_alerts_enabled                                  = var.monitoring_alerts_enabled
  resource_group_name                                        = var.resource_group_name
  resource_suffix                                            = var.resource_suffix
  tags                                                       = var.tags
  integration_subnet_id                                      = var.back_office_integration_subnet_id
  back_office_api_host                                       = module.app_service["back_office_api"].default_site_hostname
  function_apps_storage_account                              = var.document_check_function_storage_name
  function_apps_storage_account_access_key                   = var.document_check_function_storage_primary_access_key
  key_vault_id                                               = var.key_vault_id
  key_vault_uri                                              = var.key_vault_uri
  servicebus_topic_deadline_submission_topic_id              = var.servicebus_topic_deadline_submission_topic_id
  servicebus_topic_register_nsip_subscription_id             = var.servicebus_topic_register_nsip_subscription_id
  servicebus_topic_register_representation_id                = var.servicebus_topic_register_representation_id
  servicebus_topic_deadline_submission_result_id             = var.servicebus_topic_deadline_submission_result_id
  service_bus_namespace_name                                 = var.service_bus_namespace_name
  back_office_storage_account_host                           = var.document_storage_api_host
  app_service_plan_id                                        = azurerm_service_plan.back_office_functions_plan.id
  deadline_submissions_result_topic_name                     = var.deadline_submissions_result_topic_name
  document_storage_submissions_container_resource_manager_id = var.document_storage_submissions_container_resource_manager_id
  document_storage_uploads_container_resource_manager_id     = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  service_bus_config                                         = var.service_bus_config

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
