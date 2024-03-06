module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/appeals-app-services"

  action_group_ids                                                            = var.action_group_ids
  allow_testing_overrides                                                     = var.allow_testing_overrides
  api_timeout                                                                 = var.api_timeout
  app_service_plan_id                                                         = var.app_service_plan_id
  app_service_private_dns_zone_id                                             = data.azurerm_private_dns_zone.app_service.id
  appeals_api_service_bus_enabled                                             = var.appeals_api_service_bus_enabled
  appeals_feature_back_office_subscriber_enabled                              = var.appeals_feature_back_office_subscriber_enabled
  appeal_documents_storage_container_name                                     = var.appeal_documents_storage_container_name
  appeals_service_public_url                                                  = var.appeals_service_public_url
  back_office_service_bus_namespace_name                                      = var.back_office_service_bus_namespace_name
  back_office_appellant_submission_topic                                      = var.back_office_appellant_submission_topic
  back_office_lpa_response_submission_topic                                   = var.back_office_lpa_response_submission_topic
  bo_storage_account_id                                                       = var.bo_storage_account_id
  bo_appeals_document_container_id                                            = var.bo_appeals_document_container_id
  bo_appeals_document_container_name                                          = var.bo_appeals_document_container_name
  back_office_document_storage_api_host                                       = var.back_office_document_storage_api_host
  clamav_host                                                                 = var.clamav_host
  comment_planning_appeal_public_url                                          = var.comment_planning_appeal_public_url
  common_integration_functions_subnet_id                                      = var.common_integration_functions_subnet_id
  container_registry_name                                                     = var.container_registry_name
  container_registry_rg                                                       = var.container_registry_rg
  dashboards_enabled                                                          = var.dashboards_enabled
  deploy_interested_parties                                                   = var.deploy_interested_parties
  endpoint_subnet_id                                                          = azurerm_subnet.appeals_service_ingress.id
  function_apps_storage_account                                               = var.function_apps_storage_account
  function_apps_storage_account_access_key                                    = var.function_apps_storage_account_access_key
  google_analytics_id                                                         = var.google_analytics_id
  google_tag_manager_id                                                       = var.google_tag_manager_id
  horizon_url                                                                 = var.horizon_url
  integration_functions_app_service_plan_id                                   = var.integration_functions_app_service_plan_id
  integration_subnet_id                                                       = var.integration_subnet_id
  key_vault_id                                                                = var.key_vault_id
  key_vault_uri                                                               = var.key_vault_uri
  location                                                                    = azurerm_resource_group.appeals_service_stack.location
  log_analytics_workspace_id                                                  = azurerm_log_analytics_workspace.appeals_service.id
  logger_level                                                                = var.logger_level
  monitoring_alerts_enabled                                                   = var.monitoring_alerts_enabled
  node_environment                                                            = var.node_environment
  private_endpoint_enabled                                                    = var.private_endpoint_enabled
  resource_group_id                                                           = azurerm_resource_group.appeals_service_stack.id
  resource_group_name                                                         = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                                                             = local.resource_suffix
  sb_topic_names                                                              = var.sb_topic_names
  service_bus_appeals_bo_case_topic_id                                        = var.service_bus_appeals_bo_case_topic_id
  service_bus_appeals_bo_document_topic_id                                    = var.service_bus_appeals_bo_document_topic_id
  service_bus_listed_building_topic_id                                        = var.service_bus_listed_building_topic_id
  service_name                                                                = local.service_name
  srv_admin_monitoring_email                                                  = var.srv_admin_monitoring_email
  srv_notify_base_url                                                         = var.srv_notify_base_url
  srv_notify_failure_to_upload_to_horizon_template_id                         = var.srv_notify_failure_to_upload_to_horizon_template_id
  srv_notify_final_comment_submission_confirmation_email_template_id          = var.srv_notify_final_comment_submission_confirmation_email_template_id
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id          = var.srv_notify_full_appeal_confirmation_email_to_appellant_template_id
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id       = var.srv_notify_full_appeal_received_notification_email_to_lpa_template_id
  srv_notify_save_and_return_continue_with_appeal_template_id                 = var.srv_notify_save_and_return_continue_with_appeal_template_id
  srv_notify_save_and_return_enter_code_into_service_template_id              = var.srv_notify_save_and_return_enter_code_into_service_template_id
  srv_notify_confirm_email_template_id                                        = var.srv_notify_confirm_email_template_id
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id    = var.srv_notify_appeal_submission_confirmation_email_to_appellant_template_id
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id = var.srv_notify_appeal_submission_received_notification_email_to_lpa_template_id
  srv_notify_appellant_login_confirm_registration_template_id                 = var.srv_notify_appellant_login_confirm_registration_template_id
  srv_notify_start_email_to_lpa_template_id                                   = var.srv_notify_start_email_to_lpa_template_id
  srv_notify_lpa_dashboard_invite_template_id                                 = var.srv_notify_lpa_dashboard_invite_template_id
  srv_notify_service_id                                                       = var.srv_notify_service_id
  task_submit_to_horizon_cron_string                                          = var.task_submit_to_horizon_cron_string
  task_submit_to_horizon_trigger_active                                       = var.task_submit_to_horizon_trigger_active
  appeals_frontend_file_upload_debug_logging_enabled                          = var.appeals_frontend_file_upload_debug_logging_enabled

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
