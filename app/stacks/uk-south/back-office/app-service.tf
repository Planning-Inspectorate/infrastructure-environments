module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/back-office-app-services"

  action_group_low_id                              = var.action_group_low_id
  app_service_plan_id                              = var.app_service_plan_id
  app_service_plan_resource_group_name             = var.common_resource_group_name
  app_service_private_dns_zone_id                  = data.azurerm_private_dns_zone.app_service.id
  azuread_auth_client_id                           = var.azuread_auth_client_id
  azuread_appeals_case_officer_group_id            = var.azuread_appeals_case_officer_group_id
  azuread_appeals_inspector_group_id               = var.azuread_appeals_inspector_group_id
  azuread_appeals_validation_officer_group_id      = var.azuread_appeals_validation_officer_group_id
  azuread_applications_case_admin_officer_group_id = var.azuread_applications_case_admin_officer_group_id
  azuread_applications_caseteam_group_id           = var.azuread_applications_caseteam_group_id
  azuread_applications_inspector_group_id          = var.azuread_applications_inspector_group_id
  back_office_integration_subnet_id                = var.back_office_integration_subnet_id
  back_office_clamav_subnet_id                     = var.back_office_clamav_subnet_id
  container_registry_name                          = var.container_registry_name
  container_registry_rg                            = var.container_registry_rg
  custom_hostname                                  = var.back_office_public_url
  custom_hostname_certificate_secret_id            = data.azurerm_key_vault_certificate.wildcard_certificate.id
  database_connection_string                       = local.sql_connection_string
  document_storage_api_host                        = var.back_office_document_storage_api_host
  back_office_document_storage_api_host            = var.back_office_document_storage_api_host
  endpoint_subnet_id                               = azurerm_subnet.back_office_ingress.id
  integration_subnet_id                            = var.integration_subnet_id
  key_vault_id                                     = var.key_vault_id
  key_vault_uri                                    = var.key_vault_uri
  location                                         = azurerm_resource_group.back_office_stack.location
  log_analytics_workspace_id                       = azurerm_log_analytics_workspace.back_office.id
  monitoring_alerts_enabled                        = var.monitoring_alerts_enabled
  node_environment                                 = var.node_environment
  private_endpoint_enabled                         = var.private_endpoint_enabled
  resource_group_name                              = azurerm_resource_group.back_office_stack.name
  resource_suffix                                  = local.resource_suffix
  service_bus_namespace_name                       = azurerm_servicebus_namespace.back_office[0].name
  service_bus_namespace_id                         = azurerm_servicebus_namespace.back_office[0].id
  service_name                                     = local.service_name
  feature_service_bus_enabled                      = var.feature_service_bus_enabled
  # Document scanning is disabled for the secondary region because the effort to implement it probably isn't worth it compared to just having a degraded service for the duration of an outage
  # To be clear, a 'degraded' service here means that end users can still upload documents but they won't be scanned until the primary region is back online (and so the new documents won't be accessible)
  feature_document_scanning_enabled                                                   = false
  common_vnet_id                                                                      = var.common_vnet_id
  environment                                                                         = var.environment
  document_check_function_storage_name                                                = var.document_check_function_storage_name
  document_storage_back_office_document_service_uploads_container_resource_manager_id = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  document_storage_back_office_published_documents_container_resource_manager_id      = var.document_storage_back_office_published_documents_container_resource_manager_id
  document_check_function_storage_primary_access_key                                  = var.document_check_function_storage_primary_access_key
  document_storage_back_office_document_service_uploads_container_name                = var.document_storage_back_office_document_service_uploads_container_name
  servicebus_topic_nsip_documents_id                                                  = var.servicebus_topic_nsip_documents_id
  feature_odw_subscription_enabled                                                    = false
  servicebus_queue_nsip_documents_to_publish_id                                       = var.servicebus_queue_nsip_documents_to_publish_id

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
