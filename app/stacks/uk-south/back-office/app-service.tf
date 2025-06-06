module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

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
  back_office_integration_subnet_id                                                   = var.back_office_integration_subnet_id
  container_registry_name                                                             = var.container_registry_name
  container_registry_rg                                                               = var.container_registry_rg
  database_name                                                                       = var.back_office_sql_database
  document_storage_api_host                                                           = var.back_office_document_storage_api_host
  document_storage_account_endpoint                                                   = ""
  endpoint_subnet_id                                                                  = azurerm_subnet.back_office_ingress.id
  integration_subnet_id                                                               = var.integration_subnet_id
  key_vault_id                                                                        = var.key_vault_id
  key_vault_uri                                                                       = var.key_vault_uri
  location                                                                            = azurerm_resource_group.back_office_stack.location
  log_analytics_workspace_id                                                          = azurerm_log_analytics_workspace.back_office.id
  monitoring_alerts_enabled                                                           = var.monitoring_alerts_enabled
  node_environment                                                                    = var.node_environment
  private_endpoint_enabled                                                            = var.private_endpoint_enabled
  resource_group_name                                                                 = azurerm_resource_group.back_office_stack.name
  resource_suffix                                                                     = local.resource_suffix
  sensitive_application_case_references                                               = var.sensitive_application_case_references
  service_bus_namespace_name                                                          = azurerm_servicebus_namespace.back_office[0].name
  service_bus_namespace_id                                                            = azurerm_servicebus_namespace.back_office[0].id
  service_name                                                                        = local.service_name
  feature_service_bus_enabled                                                         = var.feature_service_bus_enabled
  document_check_function_storage_name                                                = var.document_check_function_storage_name
  document_storage_back_office_document_service_uploads_container_resource_manager_id = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  document_storage_back_office_published_documents_container_resource_manager_id      = var.document_storage_back_office_published_documents_container_resource_manager_id
  document_storage_submissions_container_resource_manager_id                          = var.document_storage_submissions_container_resource_manager_id
  document_check_function_storage_primary_access_key                                  = var.document_check_function_storage_primary_access_key
  document_storage_back_office_document_service_uploads_container_name                = var.document_storage_back_office_document_service_uploads_container_name
  servicebus_topic_nsip_documents_id                                                  = var.servicebus_topic_nsip_documents_id
  deadline_submissions_result_topic_name                                              = ""
  malware_scanning_topic_id                                                           = ""

  back_office_applications_redis_connection_string_secret_name = azurerm_key_vault_secret.back_office_applications_redis_cache_connection_string_secret[count.index].name

  service_bus_config = var.service_bus_config

  # TODO: DR strategy to figure out how to handle service bus fail-over
  servicebus_topic_nsip_project_update_id         = ""
  servicebus_topic_register_nsip_subscription_id  = ""
  servicebus_topic_deadline_submission_topic_id   = ""
  servicebus_topic_deadline_submission_topic_name = ""
  servicebus_topic_deadline_submission_result_id  = ""
  servicebus_topic_register_representation_id     = ""

  # notify subscribers configuration
  notify_subscribers_function_gov_notify_template_id       = var.notify_subscribers_function_gov_notify_template_id
  notify_subscribers_function_gov_notify_template_welsh_id = var.notify_subscribers_function_gov_notify_template_welsh_id
  applications_front_office_web_url                        = var.applications_front_office_web_url

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
