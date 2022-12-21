module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/applications-app-services"

  action_group_low_id                                             = var.action_group_low_id
  api_timeout                                                     = var.api_timeout
  app_service_plan_id                                             = var.app_service_plan_id
  app_service_private_dns_zone_id                                 = data.azurerm_private_dns_zone.app_service.id
  applications_service_public_url                                 = var.applications_service_public_url
  container_registry_name                                         = var.container_registry_name
  container_registry_rg                                           = var.container_registry_rg
  endpoint_subnet_id                                              = azurerm_subnet.applications_service_ingress.id
  google_analytics_id                                             = var.google_analytics_id
  integration_subnet_id                                           = var.integration_subnet_id
  key_vault_id                                                    = var.key_vault_id
  key_vault_uri                                                   = var.key_vault_uri
  location                                                        = azurerm_resource_group.applications_service_stack.location
  log_analytics_workspace_id                                      = azurerm_log_analytics_workspace.applcations_service.id
  logger_level                                                    = var.logger_level
  monitoring_alerts_enabled                                       = var.monitoring_alerts_enabled
  node_environment                                                = var.node_environment
  private_endpoint_enabled                                        = var.private_endpoint_enabled
  resource_group_name                                             = azurerm_resource_group.applications_service_stack.name
  resource_suffix                                                 = local.resource_suffix
  service_name                                                    = local.service_name
  srv_notify_base_url                                             = var.srv_notify_base_url
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
  srv_notify_magic_link_email_template_id                         = var.srv_notify_magic_link_email_template_id
  srv_notify_submission_complete_email_template_id                = var.srv_notify_submission_complete_email_template_id
  srv_notify_service_id                                           = var.srv_notify_service_id
  private_beta_v1_routes_only                                     = var.private_beta_v1_routes_only
  feature_save_and_exit_option                                    = var.feature_save_and_exit_option
  feature_show_affected_area_section                              = var.feature_show_affected_area_section
  feature_hide_project_timeline_link                              = var.feature_hide_project_timeline_link
  feature_allow_document_library                                  = var.feature_allow_document_library
  feature_allow_examination_timetable                             = var.feature_allow_examination_timetable
  feature_allow_representation                                    = var.feature_allow_representation
  documents_host                                                  = var.documents_host

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
