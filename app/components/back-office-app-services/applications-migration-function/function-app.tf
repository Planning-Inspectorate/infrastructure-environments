module "applications_migration_function" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.14"

  action_group_ids                         = var.action_group_ids
  app_name                                 = local.service_name
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.integration_subnet_id
  # adding key_vault_id creates a read_secrets permission (see import)
  key_vault_id               = var.key_vault_id
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  monitoring_alerts_enabled  = var.monitoring_alerts_enabled
  outbound_vnet_connectivity = true
  resource_group_name        = var.resource_group_name
  resource_suffix            = var.resource_suffix
  service_name               = local.service_name
  use_app_insights           = true
  function_node_version      = 18

  app_settings = {
    # Function env variables
    API_HOST          = var.back_office_api_host
    KEY_VAULT_ENABLED = var.api_key_vault_authorization_enabled
    KEY_VAULT_URI     = var.key_vault_uri
    NODE_ENV          = var.node_environment
    # Temporary migration variables for Project Updates
    NI_DB_MYSQL_DATABASE = local.secret_refs["applications-service-mysql-database"]
    NI_DB_MYSQL_DIALECT  = local.secret_refs["applications-service-mysql-dialect"]
    NI_DB_MYSQL_HOST     = local.secret_refs["applications-service-mysql-host"]
    NI_DB_MYSQL_PASSWORD = local.secret_refs["applications-service-mysql-password"]
    NI_DB_MYSQL_PORT     = local.secret_refs["applications-service-mysql-port"]
    NI_DB_MYSQL_USERNAME = local.secret_refs["applications-service-mysql-username"]
    # ODW Synapse Configuration
    # We only provide this if there is an endpoint available, and it will currently only be available in dev
    SYNAPSE_SQL_HOST = var.odw_synapse_ssql_endpoint
  }

  tags = var.tags
}

locals {
  # These are secrets we don't intend to create, but just need a reference to
  secret_names = [
    # Secrets owned by the applications service, soon to be replaced with our own
    "applications-service-mysql-database",
    "applications-service-mysql-dialect",
    "applications-service-mysql-host",
    "applications-service-mysql-password",
    "applications-service-mysql-port",
    "applications-service-mysql-username",
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }
}
