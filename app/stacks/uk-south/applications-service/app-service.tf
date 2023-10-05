module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/applications-app-services"

  action_group_low_id                                             = var.action_group_low_id
  api_timeout                                                     = var.api_timeout
  app_service_plan_id                                             = var.app_service_plan_id
  app_service_private_dns_zone_id                                 = data.azurerm_private_dns_zone.app_service.id
  applications_service_public_url                                 = var.applications_service_public_url
  applications_service_redis_connection_string_secret_name        = azurerm_key_vault_secret.redis_cache_connection_string[count.index].name
  applications_sql_server_connection_string                       = local.sql_connection_string
  applications_sql_server_connection_string_jbdc                  = local.sql_jbdc_connection_string
  back_office_integration_get_application_case_references         = var.back_office_integration_get_application_case_references
  back_office_integration_get_documents_case_references           = var.back_office_integration_get_documents_case_references
  back_office_integration_post_submissions_case_references        = var.back_office_integration_post_submissions_case_references
  back_office_integration_get_timetable_case_references           = var.back_office_integration_get_timetable_case_references
  back_office_service_bus_namespace_name                          = var.back_office_service_bus_namespace_name
  back_office_service_bus_nsip_project_topic_id                   = var.back_office_service_bus_nsip_project_topic_id
  back_office_service_bus_nsip_document_topic_id                  = var.back_office_service_bus_nsip_document_topic_id
  back_office_service_bus_register_nsip_subscription_topic_id     = var.back_office_service_bus_register_nsip_subscription_topic_id
  back_office_service_bus_nsip_project_update_topic_id            = var.back_office_service_bus_nsip_project_update_topic_id
  back_office_service_bus_nsip_representation_topic_id            = var.back_office_service_bus_nsip_representation_topic_id
  back_office_submissions_storage_container_resource_manager_id   = var.back_office_submissions_storage_container_resource_manager_id
  container_registry_name                                         = var.container_registry_name
  container_registry_rg                                           = var.container_registry_rg
  documents_host                                                  = var.documents_host
  endpoint_subnet_id                                              = azurerm_subnet.applications_service_ingress.id
  feature_allow_document_library                                  = var.feature_allow_document_library
  feature_allow_examination_timetable                             = var.feature_allow_examination_timetable
  feature_allow_representation                                    = var.feature_allow_representation
  feature_back_office_subscriber_enabled                          = false
  feature_hide_project_timeline_link                              = var.feature_hide_project_timeline_link
  feature_redis_session_store                                     = var.feature_redis_session_store
  feature_save_and_exit_option                                    = var.feature_save_and_exit_option
  feature_show_affected_area_section                              = var.feature_show_affected_area_section
  feature_enabled_content_security_policy                         = var.feature_enabled_content_security_policy
  feature_allow_section_51                                        = var.feature_allow_section_51
  feature_allow_get_updates                                       = var.feature_allow_get_updates
  feature_allow_project_information                               = var.feature_allow_project_information
  feature_allow_have_your_say                                     = var.feature_allow_have_your_say
  feature_enable_generalised_form_sanitisation                    = var.feature_enable_generalised_form_sanitisation
  function_storage_name                                           = var.function_storage_name
  function_storage_primary_access_key                             = var.function_storage_primary_access_key
  google_analytics_id                                             = var.google_analytics_id
  integration_subnet_id                                           = var.integration_subnet_id
  key_vault_id                                                    = var.key_vault_id
  key_vault_uri                                                   = var.key_vault_uri
  location                                                        = azurerm_resource_group.applications_service_stack.location
  log_analytics_workspace_id                                      = azurerm_log_analytics_workspace.applcations_service.id
  logger_level                                                    = var.logger_level
  monitoring_alerts_enabled                                       = var.monitoring_alerts_enabled
  node_environment                                                = var.node_environment
  private_beta_v1_routes_only                                     = var.private_beta_v1_routes_only
  private_endpoint_enabled                                        = var.private_endpoint_enabled
  resource_group_name                                             = azurerm_resource_group.applications_service_stack.name
  resource_suffix                                                 = local.resource_suffix
  service_name                                                    = local.service_name
  srv_notify_base_url                                             = var.srv_notify_base_url
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
  srv_notify_magic_link_email_template_id                         = var.srv_notify_magic_link_email_template_id
  srv_notify_service_id                                           = var.srv_notify_service_id
  srv_notify_submission_complete_email_template_id                = var.srv_notify_submission_complete_email_template_id
  srv_notify_subscription_create_email_template_id                = var.srv_notify_subscription_create_email_template_id
  project_migration_case_references                               = var.project_migration_case_references


  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
