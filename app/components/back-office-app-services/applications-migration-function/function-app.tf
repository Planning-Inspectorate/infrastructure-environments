module "applications_migration_function" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-function-app?ref=1.3"

  action_group_low_id                      = var.action_group_low_id
  app_name                                 = "apps-migration"
  app_service_plan_id                      = var.app_service_plan_id
  function_apps_storage_account            = var.function_apps_storage_account
  function_apps_storage_account_access_key = var.function_apps_storage_account_access_key
  integration_subnet_id                    = var.integration_subnet_id
  location                                 = var.location
  log_analytics_workspace_id               = var.log_analytics_workspace_id
  monitoring_alerts_enabled                = var.monitoring_alerts_enabled
  outbound_vnet_connectivity               = true
  resource_group_name                      = var.resource_group_name
  resource_suffix                          = var.resource_suffix
  service_name                             = "apps-migration"
  use_app_insights                         = true
  function_node_version                    = 18

  app_settings = {
    # Function env variables
    API_HOST = var.back_office_api_host
    # Temporary migration variables for Project Updates
    NI_DB_MYSQL_DATABASE = local.secret_refs["applications-service-mysql-database"]
    NI_DB_MYSQL_DIALECT  = local.secret_refs["applications-service-mysql-dialect"]
    NI_DB_MYSQL_HOST     = local.secret_refs["applications-service-mysql-host"]
    NI_DB_MYSQL_PASSWORD = local.secret_refs["applications-service-mysql-password"]
    NI_DB_MYSQL_PORT     = local.secret_refs["applications-service-mysql-port"]
    NI_DB_MYSQL_USERNAME = local.secret_refs["applications-service-mysql-username"]
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