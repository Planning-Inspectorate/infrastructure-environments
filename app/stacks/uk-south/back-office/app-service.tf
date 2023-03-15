module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/back-office-app-services"

  action_group_low_id                                = var.action_group_low_id
  app_service_plan_id                                = var.app_service_plan_id
  app_service_plan_resource_group_name               = var.common_resource_group_name
  app_service_private_dns_zone_id                    = data.azurerm_private_dns_zone.app_service.id
  azuread_auth_client_id                             = var.azuread_auth_client_id
  azuread_auth_api_client_id                         = var.azuread_auth_api_client_id
  feature_client_credentials_grant_enabled           = var.feature_client_credentials_grant_enabled
  azuread_appeals_case_officer_group_id              = var.azuread_appeals_case_officer_group_id
  azuread_appeals_inspector_group_id                 = var.azuread_appeals_inspector_group_id
  azuread_appeals_validation_officer_group_id        = var.azuread_appeals_validation_officer_group_id
  azuread_applications_case_admin_officer_group_id   = var.azuread_applications_case_admin_officer_group_id
  azuread_applications_caseteam_group_id             = var.azuread_applications_caseteam_group_id
  azuread_applications_inspector_group_id            = var.azuread_applications_inspector_group_id
  back_office_integration_subnet_id                  = var.back_office_integration_subnet_id
  back_office_clamav_subnet_id                       = var.back_office_clamav_subnet_id
  container_registry_name                            = var.container_registry_name
  container_registry_rg                              = var.container_registry_rg
  custom_hostname                                    = var.back_office_public_url
  custom_hostname_certificate_secret_id              = data.azurerm_key_vault_certificate.wildcard_certificate.id
  database_connection_string                         = local.sql_connection_string
  document_storage_api_host                          = var.back_office_document_storage_api_host
  document_storage_container                         = var.back_office_document_storage_container_name
  document_storage_back_office_documents_id          = var.back_office_document_storage_documents_id
  back_office_document_storage_connection_string     = var.back_office_document_storage_connection_string
  endpoint_subnet_id                                 = azurerm_subnet.back_office_ingress.id
  integration_subnet_id                              = var.integration_subnet_id
  key_vault_id                                       = var.key_vault_id
  key_vault_uri                                      = var.key_vault_uri
  location                                           = azurerm_resource_group.back_office_stack.location
  log_analytics_workspace_id                         = azurerm_log_analytics_workspace.back_office.id
  monitoring_alerts_enabled                          = var.monitoring_alerts_enabled
  node_environment                                   = var.node_environment
  private_endpoint_enabled                           = var.private_endpoint_enabled
  resource_group_name                                = azurerm_resource_group.back_office_stack.name
  resource_suffix                                    = local.resource_suffix
  service_bus_namespace_name                         = azurerm_servicebus_namespace.back_office[0].name
  service_bus_namespace_id                           = azurerm_servicebus_namespace.back_office[0].id
  service_name                                       = local.service_name
  feature_service_bus_enabled                        = var.feature_service_bus_enabled
  feature_document_scanning_enabled                  = var.feature_document_scanning_enabled
  common_vnet_id                                     = var.common_vnet_id
  environment                                        = var.environment
  document_check_function_storage_name               = var.document_check_function_storage_name
  document_check_function_storage_primary_access_key = var.document_check_function_storage_primary_access_key
  feature_odw_subscription_enabled                   = false

  tags = local.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
