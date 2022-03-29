module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/appeals-app-services"

  action_group_low_id                                                         = var.action_group_low_id
  api_timeout                                                                 = var.api_timeout
  app_insights_connection_string                                              = var.app_insights_connection_string
  app_insights_instrumentation_key                                            = var.app_insights_instrumentation_key
  app_service_plan_id                                                         = var.app_service_plan_id
  app_service_private_dns_zone_id                                             = data.azurerm_private_dns_zone.app_service.id
  appeal_documents_primary_blob_connection_string                             = var.appeal_documents_primary_blob_connection_string
  appeal_documents_storage_container_name                                     = var.appeal_documents_storage_container_name
  appeals_service_public_url                                                  = var.appeals_service_public_url
  container_registry_login_server                                             = data.azurerm_container_registry.acr.login_server
  container_registry_password                                                 = data.azurerm_container_registry.acr.admin_password
  container_registry_username                                                 = data.azurerm_container_registry.acr.admin_username
  cosmosdb_connection_string                                                  = var.cosmosdb_connection_string
  endpoint_subnet_id                                                          = azurerm_subnet.appeals_service_ingress.id
  environment                                                                 = var.environment
  function_apps_storage_account                                               = var.function_apps_storage_account
  google_analytics_id                                                         = var.google_analytics_id
  google_tag_manager_id                                                       = var.google_tag_manager_id
  integration_subnet_id                                                       = var.integration_subnet_id
  key_vault_id                                                                = var.key_vault_id
  key_vault_secret_refs                                                       = var.key_vault_secret_refs
  location                                                                    = azurerm_resource_group.appeals_service_stack.location
  logger_level                                                                = var.logger_level
  node_environment                                                            = var.node_environment
  resource_group_id                                                           = azurerm_resource_group.appeals_service_stack.id
  resource_group_name                                                         = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                                                             = local.resource_suffix
  service_name                                                                = local.service_name
  srv_notify_appeal_submission_confirmation_email_to_apellant_template_id     = var.srv_notify_appeal_submission_confirmation_email_to_apellant_template_id
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id = var.srv_notify_appeal_submission_received_notification_email_to_lpa_template_id
  srv_notify_base_url                                                         = var.srv_notify_base_url
  srv_notify_email_reply_to_id_start_email_to_lpa_template_id                 = var.srv_notify_email_reply_to_id_start_email_to_lpa_template_id
  srv_notify_service_id                                                       = var.srv_notify_service_id
  srv_notify_start_email_to_lpa_template_id                                   = var.srv_notify_start_email_to_lpa_template_id
  srv_notify_template_id                                                      = var.srv_notify_template_id

  tags = local.tags
}
