module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/applications-app-services"

  action_group_ids                                                      = var.action_group_ids
  activate_planned_outage                                               = var.activate_planned_outage
  api_timeout                                                           = var.api_timeout
  app_service_plan_id                                                   = var.app_service_plan_id
  app_service_private_dns_zone_id                                       = data.azurerm_private_dns_zone.app_service.id
  applications_service_public_url                                       = var.applications_service_public_url
  applications_service_redis_connection_string_secret_name              = azurerm_key_vault_secret.redis_cache_connection_string[count.index].name
  back_office_service_bus_namespace_name                                = var.back_office_service_bus_namespace_name
  back_office_service_bus_deadline_submission_topic_id                  = var.back_office_service_bus_deadline_submission_topic_id
  back_office_service_bus_nsip_project_topic_id                         = var.back_office_service_bus_nsip_project_topic_id
  back_office_service_bus_nsip_document_topic_id                        = var.back_office_service_bus_nsip_document_topic_id
  back_office_service_bus_register_nsip_subscription_topic_id           = var.back_office_service_bus_register_nsip_subscription_topic_id
  back_office_service_bus_register_representation_topic_id              = var.back_office_service_bus_register_representation_topic_id
  back_office_service_bus_nsip_project_update_topic_id                  = var.back_office_service_bus_nsip_project_update_topic_id
  back_office_service_bus_nsip_representation_topic_id                  = var.back_office_service_bus_nsip_representation_topic_id
  back_office_service_bus_nsip_exam_timetable_topic_id                  = var.back_office_service_bus_nsip_exam_timetable_topic_id
  back_office_service_bus_nsip_service_user_topic_id                    = var.back_office_service_bus_nsip_service_user_topic_id
  back_office_service_bus_nsip_advice_topic_id                          = var.back_office_service_bus_nsip_advice_topic_id
  back_office_submissions_storage_container_name                        = var.back_office_submissions_storage_container_name
  back_office_submissions_storage_container_resource_manager_id         = var.back_office_submissions_storage_container_resource_manager_id
  back_office_submissions_storage_account_name                          = var.back_office_submissions_storage_account_name
  back_office_integration_case_references                               = var.back_office_integration_case_references
  back_office_integration_get_applications                              = var.back_office_integration_get_applications
  container_registry_name                                               = var.container_registry_name
  container_registry_rg                                                 = var.container_registry_rg
  documents_host                                                        = var.documents_host
  endpoint_subnet_id                                                    = azurerm_subnet.applications_service_ingress.id
  environment                                                           = var.environment
  feature_allow_project_information                                     = var.feature_allow_project_information
  feature_allow_welsh_translation                                       = var.feature_allow_welsh_translation
  feature_application_insights                                          = var.feature_application_insights
  feature_back_office_subscriber_enabled                                = false
  feature_enable_generalised_form_sanitisation                          = var.feature_enable_generalised_form_sanitisation
  feature_enabled_content_security_policy                               = var.feature_enabled_content_security_policy
  feature_general_s51_bo                                                = var.feature_general_s51_bo
  feature_hide_project_timeline_link                                    = var.feature_hide_project_timeline_link
  feature_home_page                                                     = var.feature_home_page
  feature_primary_navigation                                            = var.feature_primary_navigation
  feature_redis_session_store                                           = var.feature_redis_session_store
  feature_save_and_exit_option                                          = var.feature_save_and_exit_option
  feature_show_affected_area_section                                    = var.feature_show_affected_area_section
  function_storage_name                                                 = var.function_storage_name
  function_storage_primary_access_key                                   = var.function_storage_primary_access_key
  google_analytics_id                                                   = var.google_analytics_id
  integration_subnet_id                                                 = var.integration_subnet_id
  key_vault_id                                                          = var.key_vault_id
  key_vault_uri                                                         = var.key_vault_uri
  location                                                              = azurerm_resource_group.applications_service_stack.location
  log_analytics_workspace_id                                            = azurerm_log_analytics_workspace.applcations_service.id
  logger_level                                                          = var.logger_level
  monitoring_alerts_enabled                                             = var.monitoring_alerts_enabled
  node_environment                                                      = var.node_environment
  open_registration_case_references                                     = var.open_registration_case_references
  planned_outage_resume_text                                            = var.planned_outage_resume_text
  private_endpoint_enabled                                              = var.private_endpoint_enabled
  resource_group_name                                                   = azurerm_resource_group.applications_service_stack.name
  resource_suffix                                                       = local.resource_suffix
  service_name                                                          = local.service_name
  srv_notify_base_url                                                   = var.srv_notify_base_url
  srv_notify_ip_registration_confirmation_email_to_ip_template_id       = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
  srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh
  srv_notify_service_id                                                 = var.srv_notify_service_id
  srv_notify_submission_complete_email_template_id                      = var.srv_notify_submission_complete_email_template_id
  srv_notify_submission_complete_email_template_id_welsh                = var.srv_notify_submission_complete_email_template_id_welsh
  srv_notify_subscription_create_email_template_id                      = var.srv_notify_subscription_create_email_template_id
  srv_notify_subscription_create_email_template_id_welsh                = var.srv_notify_subscription_create_email_template_id_welsh
  service_bus_config                                                    = var.service_bus_config

  health_check_eviction_time_in_min = var.health_check_eviction_time_in_min
  auth_config = {
    auth_enabled           = var.auth_config.auth_enabled
    require_authentication = var.auth_config.require_authentication
    auth_client_id         = var.auth_config.auth_client_id
    auth_provider_secret   = var.auth_config.auth_provider_secret
    auth_tenant_endpoint   = var.auth_config.auth_tenant_endpoint
    allowed_audiences      = var.auth_config.allowed_audiences
    allowed_applications   = var.auth_config.allowed_applications
  }

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
