module "applications_migration_function" {
  source = "./applications-migration-function"

  action_group_low_id                      = var.action_group_low_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  tags                                     = var.tags
  integration_subnet_id                    = var.back_office_integration_subnet_id
  back_office_api_host                     = module.app_service["back_office_api"].default_site_hostname
  function_apps_storage_account            = var.document_check_function_storage_name
  function_apps_storage_account_access_key = var.document_check_function_storage_primary_access_key
  app_service_plan_id                      = azurerm_service_plan.back_office_functions_plan.id
  key_vault_uri                            = var.key_vault_uri
  key_vault_id                             = var.key_vault_id
  tenant_id                                = data.azurerm_client_config.current.tenant_id
  node_environment                         = var.node_environment
  odw_subscription_id                      = var.odw_subscription_id
  odw_resource_group_name                  = var.odw_resource_group_name
  odw_data_lake_storage_account_name       = var.odw_data_lake_storage_account_name
  odw_synapse_workspace_name               = var.odw_synapse_workspace_name
  environment                              = var.environment

  providers = {
    azurerm = azurerm
  }
}
