module "app_services" {
  source = "../../../components/appeals-app-services"

  app_insights_connection_string                                              = var.app_insights_connection_string
  app_insights_instrumentation_key                                            = var.app_insights_instrumentation_key
  app_service_plan_id                                                         = var.app_service_plan_id
  app_service_private_dns_zone_id                                             = var.app_service_private_dns_zone_id
  appeals_service_public_url                                                  = var.appeals_service_public_url
  container_registry_login_server                                             = data.azurerm_container_registry.acr.login_server
  container_registry_password                                                 = data.azurerm_container_registry.acr.admin_password
  container_registry_username                                                 = data.azurerm_container_registry.acr.admin_username
  cosmosdb_connection_string                                                  = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
  endpoint_subnet_id                                                          = azurerm_subnet.appeals_service_ingress.id
  function_apps_storage_account                                               = azurerm_storage_account.function_apps.name
  function_apps_storage_account_primary_access_key                            = azurerm_storage_account.function_apps.primary_connection_string
  integration_subnet_id                                                       = var.integration_subnet_id
  key_vault_id                                                                = var.key_vault_id
  key_vault_secret_refs                                                       = var.key_vault_secret_refs
  location                                                                    = module.azure_region_primary.location
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
