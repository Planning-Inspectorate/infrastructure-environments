module "app_services" {
  count = var.is_dr_deployment ? 1 : 0

  source = "../../../components/back-office-app-services"

  action_group_low_id                     = var.action_group_low_id
  app_insights_connection_string          = var.app_insights_connection_string
  app_insights_instrumentation_key        = var.app_insights_instrumentation_key
  app_service_plan_id                     = var.app_service_plan_id
  app_service_private_dns_zone_id         = data.azurerm_private_dns_zone.app_service.id
  azuread_auth_case_officer_group_id      = var.azuread_auth_case_officer_group_id
  azuread_auth_client_id                  = var.azuread_auth_client_id
  azuread_auth_inspector_group_id         = var.azuread_auth_inspector_group_id
  azuread_auth_validation_office_group_id = var.azuread_auth_validation_office_group_id
  container_registry_login_server         = data.azurerm_container_registry.acr.login_server
  container_registry_password             = data.azurerm_container_registry.acr.admin_password
  container_registry_username             = data.azurerm_container_registry.acr.admin_username
  database_connection_string              = local.sql_connection_string
  endpoint_subnet_id                      = azurerm_subnet.back_office_ingress.id
  integration_subnet_id                   = var.integration_subnet_id
  key_vault_id                            = var.key_vault_id
  key_vault_uri                           = var.key_vault_uri
  location                                = azurerm_resource_group.back_office_stack.location
  monitoring_alerts_enabled               = var.monitoring_alerts_enabled
  node_environment                        = var.node_environment
  resource_group_name                     = azurerm_resource_group.back_office_stack.name
  resource_suffix                         = local.resource_suffix
  service_name                            = local.service_name
  use_deployment_slots                    = var.use_deployment_slots

  tags = local.tags
}
