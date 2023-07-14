module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/appeals-app-services"

  action_group_low_id                                                         = var.action_group_low_id
  api_timeout                                                                 = var.api_timeout
  app_service_plan_id                                                         = var.app_service_plan_id
  app_service_private_dns_zone_id                                             = data.azurerm_private_dns_zone.app_service.id
  appeal_documents_primary_blob_connection_string                             = var.appeal_documents_primary_blob_connection_string
  appeal_documents_storage_container_name                                     = var.appeal_documents_storage_container_name
  appeals_service_public_url                                                  = var.appeals_service_public_url
  container_registry_name                                                     = var.container_registry_name
  container_registry_rg                                                       = var.container_registry_rg
  cosmosdb_connection_string                                                  = var.cosmosdb_connection_string
  endpoint_subnet_id                                                          = azurerm_subnet.appeals_service_ingress.id
  function_apps_storage_account                                               = var.function_apps_storage_account
  function_apps_storage_account_access_key                                    = var.function_apps_storage_account_access_key
  google_analytics_id                                                         = var.google_analytics_id
  google_tag_manager_id                                                       = var.google_tag_manager_id
  horizon_url                                                                 = var.horizon_url
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
  srv_notify_start_email_to_lpa_template_id                                   = var.srv_notify_start_email_to_lpa_template_id
  srv_notify_lpa_dashboard_invite_template_id                                 = var.srv_notify_lpa_dashboard_invite_template_id
  srv_notify_service_id                                                       = var.srv_notify_service_id
  task_submit_to_horizon_cron_string                                          = var.task_submit_to_horizon_cron_string
  task_submit_to_horizon_trigger_active                                       = var.task_submit_to_horizon_trigger_active
  allow_testing_overrides                                                     = var.allow_testing_overrides

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
