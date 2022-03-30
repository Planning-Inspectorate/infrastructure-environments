module "app_services" {
  source = "../../../components/applications-app-services"

  action_group_low_id                                             = var.action_group_low_id
  api_timeout                                                     = var.api_timeout
  app_insights_connection_string                                  = var.app_insights_connection_string
  app_insights_instrumentation_key                                = var.app_insights_instrumentation_key
  app_service_plan_id                                             = var.app_service_plan_id
  app_service_private_dns_zone_id                                 = data.azurerm_private_dns_zone.app_service.id
  applications_service_public_url                                 = var.applications_service_public_url
  container_registry_login_server                                 = data.azurerm_container_registry.acr.login_server
  container_registry_password                                     = data.azurerm_container_registry.acr.admin_password
  container_registry_username                                     = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                                              = azurerm_subnet.applications_service_ingress.id
  google_analytics_id                                             = var.google_analytics_id
  integration_subnet_id                                           = var.integration_subnet_id
  key_vault_id                                                    = var.key_vault_id
  key_vault_secret_refs                                           = var.key_vault_secret_refs
  location                                                        = azurerm_resource_group.applications_service_stack.location
  monitoring_alerts_enabled                                       = var.monitoring_alerts_enabled
  logger_level                                                    = var.logger_level
  node_environment                                                = var.node_environment
  resource_group_name                                             = azurerm_resource_group.applications_service_stack.name
  resource_suffix                                                 = local.resource_suffix
  service_name                                                    = local.service_name
  srv_notify_base_url                                             = var.srv_notify_base_url
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
  srv_notify_magic_link_email_template_id                         = var.srv_notify_magic_link_email_template_id
  srv_notify_service_id                                           = var.srv_notify_service_id
  private_beta_v1_routes_only                                     = var.private_beta_v1_routes_only

  tags = local.tags
}
