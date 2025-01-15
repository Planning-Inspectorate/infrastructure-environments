module "app_services" {
  source = "../../../components/back-office-app-services"

  action_group_ids                                                                    = var.action_group_ids
  api_key_vault_authorization_enabled                                                 = var.api_key_vault_authorization_enabled
  app_service_plan_id                                                                 = var.app_service_plan_id
  app_service_private_dns_zone_id                                                     = data.azurerm_private_dns_zone.app_service.id
  azuread_auth_client_id                                                              = var.azuread_auth_client_id
  azuread_applications_case_admin_officer_group_id                                    = var.azuread_applications_case_admin_officer_group_id
  azuread_applications_caseteam_group_id                                              = var.azuread_applications_caseteam_group_id
  azuread_applications_inspector_group_id                                             = var.azuread_applications_inspector_group_id
  back_office_applications_log_level_file                                             = var.back_office_applications_log_level_file
  back_office_applications_log_level_stdout                                           = var.back_office_applications_log_level_stdout
  back_office_hostname                                                                = var.back_office_public_url_new == null ? var.back_office_public_url : var.back_office_public_url_new
  integration_subnet_id                                                               = var.integration_subnet_id
  back_office_integration_subnet_id                                                   = var.back_office_integration_subnet_id
  container_registry_name                                                             = var.container_registry_name
  container_registry_rg                                                               = var.container_registry_rg
  database_name                                                                       = azurerm_mssql_database.back_office.name
  document_storage_api_host                                                           = var.back_office_published_documents_domain
  document_storage_account_endpoint                                                   = azurerm_storage_account.back_office_documents.primary_blob_endpoint
  document_storage_account_name                                                       = azurerm_storage_account.back_office_documents.name
  endpoint_subnet_id                                                                  = azurerm_subnet.back_office_ingress.id
  health_check_path                                                                   = var.health_check_path
  key_vault_id                                                                        = var.key_vault_id
  key_vault_uri                                                                       = var.key_vault_uri
  location                                                                            = azurerm_resource_group.back_office_stack.location
  log_analytics_workspace_id                                                          = azurerm_log_analytics_workspace.back_office.id
  monitoring_alerts_enabled                                                           = var.monitoring_alerts_enabled
  node_environment                                                                    = var.node_environment
  private_endpoint_enabled                                                            = var.private_endpoint_enabled
  resource_group_name                                                                 = azurerm_resource_group.back_office_stack.name
  resource_suffix                                                                     = local.resource_suffix
  service_bus_namespace_name                                                          = azurerm_servicebus_namespace.back_office.name
  service_bus_namespace_id                                                            = azurerm_servicebus_namespace.back_office.id
  service_name                                                                        = local.service_name
  feature_service_bus_enabled                                                         = var.feature_service_bus_enabled
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
  servicebus_topic_deadline_submission_topic_name                                     = azurerm_servicebus_topic.deadline_submission_topic.name
  servicebus_topic_deadline_submission_result_id                                      = azurerm_servicebus_topic.deadline_submission_result.id
  servicebus_topic_register_representation_id                                         = azurerm_servicebus_topic.register_representation.id
  deadline_submissions_result_topic_name                                              = azurerm_servicebus_topic.deadline_submission_result.name
  malware_scanning_topic_id                                                           = azurerm_eventgrid_topic.malware_scanning_topic.id
  tags                                                                                = local.tags
  notify_subscribers_function_gov_notify_template_id                                  = var.notify_subscribers_function_gov_notify_template_id
  notify_subscribers_function_gov_notify_template_welsh_id                            = var.notify_subscribers_function_gov_notify_template_welsh_id
  applications_front_office_web_url                                                   = var.applications_front_office_web_url
  back_office_applications_redis_connection_string_secret_name                        = azurerm_key_vault_secret.back_office_applications_redis_cache_connection_string_secret.name
  odw_synapse_integration_enabled                                                     = var.odw_synapse_integration_enabled
  odw_synapse_ssql_endpoint                                                           = var.odw_synapse_integration_enabled ? one(data.terraform_remote_state.odw).outputs.synapse_ssql_endpoint : ""
  odw_data_lake_storage_account_id                                                    = var.odw_synapse_integration_enabled ? one(data.terraform_remote_state.odw).outputs.data_lake_account_id : ""
  service_bus_config                                                                  = var.service_bus_config

  health_check_eviction_time_in_min = var.health_check_eviction_time_in_min

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
