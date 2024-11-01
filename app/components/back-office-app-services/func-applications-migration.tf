module "applications_migration_function" {
  source = "./applications-migration-function"

  action_group_ids                         = local.bo_applications_action_group_ids
  back_office_storage_account_domain       = var.document_storage_api_host
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
  api_key_vault_authorization_enabled      = var.api_key_vault_authorization_enabled
  key_vault_uri                            = var.key_vault_uri
  key_vault_id                             = var.key_vault_id
  node_environment                         = var.node_environment

  # Synapse Migration Variables
  odw_synapse_integration_enabled  = var.odw_synapse_integration_enabled
  odw_synapse_ssql_endpoint        = var.odw_synapse_ssql_endpoint
  odw_data_lake_storage_account_id = var.odw_data_lake_storage_account_id


  providers = {
    azurerm = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
