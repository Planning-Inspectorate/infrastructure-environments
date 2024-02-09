module "applications_background_job_functions" {
  source = "./applications-background-job-functions"

  action_group_ids                                                                    = local.bo_applications_action_group_ids
  location                                                                            = var.location
  log_analytics_workspace_id                                                          = var.log_analytics_workspace_id
  monitoring_alerts_enabled                                                           = var.monitoring_alerts_enabled
  resource_group_name                                                                 = var.resource_group_name
  resource_suffix                                                                     = var.resource_suffix
  tags                                                                                = var.tags
  integration_subnet_id                                                               = var.back_office_integration_subnet_id
  function_apps_storage_account                                                       = var.document_check_function_storage_name
  function_apps_storage_account_access_key                                            = var.document_check_function_storage_primary_access_key
  back_office_api_host                                                                = module.app_service["back_office_api"].default_site_hostname
  malware_scanning_topic_id                                                           = var.malware_scanning_topic_id
  document_storage_back_office_document_service_uploads_container_resource_manager_id = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  document_storage_back_office_published_documents_container_resource_manager_id      = var.document_storage_back_office_published_documents_container_resource_manager_id
  servicebus_topic_nsip_documents_id                                                  = var.servicebus_topic_nsip_documents_id
  app_service_plan_id                                                                 = azurerm_service_plan.back_office_functions_plan.id
  service_bus_namespace_name                                                          = var.service_bus_namespace_name
  back_office_storage_account_host                                                    = var.document_storage_api_host
  key_vault_uri                                                                       = var.key_vault_uri
  key_vault_id                                                                        = var.key_vault_id
  servicebus_topic_nsip_project_update_id                                             = var.servicebus_topic_nsip_project_update_id
  encrypt_key                                                                         = local.existing_secret_refs["applications-service-encryption-secret-key"]
  gov_notify_api_key                                                                  = local.secret_refs["back-office-applications-gov-notify-api-key"]
  gov_notify_template_id                                                              = var.notify_subscribers_function_gov_notify_template_id
  applications_front_office_web_url                                                   = var.applications_front_office_web_url
  node_environment                                                                    = var.node_environment

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
