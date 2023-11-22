module "app_services" {
  source = "../../../components/back-office-app-services"

  action_group_low_id                                                                 = var.action_group_low_id
  app_service_plan_id                                                                 = var.app_service_plan_id
  app_service_private_dns_zone_id                                                     = data.azurerm_private_dns_zone.app_service.id
  azuread_auth_client_id                                                              = var.azuread_auth_client_id
  azuread_appeals_case_officer_group_id                                               = var.azuread_appeals_case_officer_group_id
  azuread_appeals_inspector_group_id                                                  = var.azuread_appeals_inspector_group_id
  azuread_appeals_cs_team_group_id                                                    = var.azuread_appeals_cs_team_group_id
  azuread_appeals_legal_team_group_id                                                 = var.azuread_appeals_legal_team_group_id
  azuread_applications_case_admin_officer_group_id                                    = var.azuread_applications_case_admin_officer_group_id
  azuread_applications_caseteam_group_id                                              = var.azuread_applications_caseteam_group_id
  azuread_applications_inspector_group_id                                             = var.azuread_applications_inspector_group_id
  back_office_applications_log_level_file                                             = var.back_office_applications_log_level_file
  back_office_applications_log_level_stdout                                           = var.back_office_applications_log_level_stdout
  back_office_appeals_log_level_file                                                  = var.back_office_appeals_log_level_file
  back_office_appeals_log_level_stdout                                                = var.back_office_appeals_log_level_stdout
  back_office_hostname                                                                = var.back_office_public_url
  back_office_appeals_hostname                                                        = var.back_office_appeals_public_url
  integration_subnet_id                                                               = var.integration_subnet_id
  back_office_integration_subnet_id                                                   = var.back_office_integration_subnet_id
  back_office_clamav_subnet_id                                                        = var.back_office_clamav_subnet_id
  container_registry_name                                                             = var.container_registry_name
  container_registry_rg                                                               = var.container_registry_rg
  database_connection_string                                                          = local.sql_connection_string
  appeals_database_connection_string                                                  = local.appeals_sql_connection_string
  document_storage_api_host                                                           = azurerm_storage_account.back_office_documents.primary_blob_endpoint
  document_storage_account_name                                                       = azurerm_storage_account.back_office_documents.name
  endpoint_subnet_id                                                                  = azurerm_subnet.back_office_ingress.id
  key_vault_id                                                                        = var.key_vault_id
  key_vault_uri                                                                       = var.key_vault_uri
  location                                                                            = azurerm_resource_group.back_office_stack.location
  log_analytics_workspace_id                                                          = azurerm_log_analytics_workspace.back_office.id
  monitoring_alerts_enabled                                                           = var.monitoring_alerts_enabled
  node_environment                                                                    = var.node_environment
  environment                                                                         = var.environment
  private_endpoint_enabled                                                            = var.private_endpoint_enabled
  resource_group_name                                                                 = azurerm_resource_group.back_office_stack.name
  resource_suffix                                                                     = local.resource_suffix
  service_bus_namespace_name                                                          = azurerm_servicebus_namespace.back_office.name
  service_bus_namespace_id                                                            = azurerm_servicebus_namespace.back_office.id
  service_name                                                                        = local.service_name
  feature_service_bus_enabled                                                         = var.feature_service_bus_enabled
  feature_document_scanning_enabled                                                   = var.feature_document_scanning_enabled
  common_vnet_id                                                                      = var.common_vnet_id
  document_check_function_storage_name                                                = azurerm_storage_account.function_storage.name
  document_check_function_storage_primary_access_key                                  = azurerm_storage_account.function_storage.primary_access_key
  document_storage_back_office_document_service_uploads_container_resource_manager_id = azurerm_storage_container.back_office_document_service_uploads_container.resource_manager_id
  document_storage_back_office_published_documents_container_resource_manager_id      = azurerm_storage_container.back_office_published_documents_container.resource_manager_id
  document_storage_submissions_container_resource_manager_id                          = azurerm_storage_container.back_office_submissions_container.resource_manager_id
  document_storage_back_office_document_service_uploads_container_name                = azurerm_storage_container.back_office_document_service_uploads_container.name
  servicebus_topic_nsip_project_update_id                                             = azurerm_servicebus_topic.nsip_project_update.id
  servicebus_topic_nsip_documents_id                                                  = azurerm_servicebus_topic.nsip_documents.id
  servicebus_topic_register_nsip_subscription_id                                      = azurerm_servicebus_topic.register_nsip_subscription.id
  servicebus_topic_deadline_submission_topic_id                                       = azurerm_servicebus_topic.deadline_submission_topic.id
  servicebus_topic_deadline_submission_result_id                                      = azurerm_servicebus_topic.deadline_submission_result.id
  deadline_submissions_topic_name                                                     = azurerm_servicebus_topic.deadline_submission_topic.name
  deadline_submissions_result_topic_name                                              = azurerm_servicebus_topic.deadline_submission_result.name
  malware_scanning_topic_id                                                           = azurerm_eventgrid_topic.malware_scanning_topic.id
  #service_bus_appeals_bo_case_topic_id                                                = azurerm_servicebus_topic.appeal_bo_case.id
  #service_bus_appeals_bo_document_topic_id                                            = azurerm_servicebus_topic.appeal_bo_document.id
  service_bus_appeals_fo_appellant_submission_id               = azurerm_servicebus_topic.appeal_fo_appellant_submission.id
  service_bus_appeals_fo_lpa_response_submission_id            = azurerm_servicebus_topic.appeal_fo_lpa_response_submission.id
  tags                                                         = local.tags
  employee_topic_id                                            = azurerm_servicebus_topic.employee.id
  feature_odw_subscription_enabled                             = true
  back_office_documents_system_topic_name                      = azurerm_eventgrid_system_topic.back_office_documents_system_topic.name
  notify_subscribers_function_gov_notify_template_id           = var.notify_subscribers_function_gov_notify_template_id
  applications_front_office_web_url                            = var.applications_front_office_web_url
  back_office_applications_redis_connection_string_secret_name = azurerm_key_vault_secret.back_office_applications_redis_cache_connection_string_secret.name
  back_office_appeals_redis_connection_string_secret_name      = azurerm_key_vault_secret.back_office_appeals_redis_cache_connection_string_secret.name
  odw_resource_group_name                                      = var.odw_resource_group_name
  odw_data_lake_storage_account_name                           = var.odw_data_lake_storage_account_name
  odw_synapse_sql_pool_host                                    = var.odw_synapse_sql_pool_host
  odw_subscription_id                                          = var.odw_subscription_id

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
