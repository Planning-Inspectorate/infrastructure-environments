locals {
  app_services = {
    back_office_frontend = {
      app_name                   = "wfe"
      front_door_restriction     = true
      image_name                 = "back-office/back-office-web"
      inbound_vnet_connectivity  = false
      integration_subnet_id      = var.integration_subnet_id
      key_vault_access           = true
      outbound_vnet_connectivity = true
      health_check_path          = var.health_check_path
      action_group_ids           = local.bo_applications_action_group_ids

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING      = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/back-office-app-insights-connection-string/)"
        ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
        AUTH_REDIRECT_PATH                         = "/auth/redirect"
        API_HOST                                   = "https://pins-app-${var.service_name}-api-${var.resource_suffix}.azurewebsites.net"
        APP_HOSTNAME                               = var.back_office_hostname
        AUTH_CLIENT_ID                             = var.azuread_auth_client_id
        AUTH_CLIENT_SECRET                         = local.secret_refs["back-office-client-secret"]
        AUTH_CLOUD_INSTANCE_ID                     = "https://login.microsoftonline.com"
        AUTH_TENANT_ID                             = data.azurerm_client_config.current.tenant_id
        APPLICATIONS_CASE_ADMIN_OFFICER_GROUP_ID   = var.azuread_applications_case_admin_officer_group_id
        APPLICATIONS_CASETEAM_GROUP_ID             = var.azuread_applications_caseteam_group_id
        APPLICATIONS_INSPECTOR_GROUP_ID            = var.azuread_applications_inspector_group_id
        AZURE_BLOB_STORE_HOST                      = var.document_storage_api_host
        KEY_VAULT_ENABLED                          = var.api_key_vault_authorization_enabled
        KEY_VAULT_URI                              = var.key_vault_uri
        LOG_LEVEL_FILE                             = var.back_office_applications_log_level_file
        LOG_LEVEL_STDOUT                           = var.back_office_applications_log_level_stdout
        NODE_ENV                                   = var.node_environment
        OS_PLACES_API_KEY                          = local.secret_refs["os-places-api-key"]
        REDIS_CONNECTION_STRING                    = local.existing_secret_refs[var.back_office_applications_redis_connection_string_secret_name]
        SESSION_SECRET                             = local.secret_refs["session-secret"]
      }
    }

    back_office_api = {
      app_name                        = "api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "back-office/back-office-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true
      health_check_path               = var.health_check_path
      action_group_ids                = local.bo_applications_action_group_ids

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING      = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/back-office-app-insights-connection-string/)"
        ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
        DATABASE_URL                               = local.existing_secret_refs["back-office-sql-connection-string-admin"]
        NODE_ENV                                   = var.node_environment
        AZURE_BLOB_STORE_HOST                      = var.document_storage_api_host
        AZURE_BLOB_STORE_CONTAINER                 = var.document_storage_back_office_document_service_uploads_container_name
        KEY_VAULT_ENABLED                          = var.api_key_vault_authorization_enabled
        KEY_VAULT_URI                              = var.key_vault_uri
        SERVICE_BUS_HOSTNAME                       = "${var.service_bus_namespace_name}.servicebus.windows.net"
        SERVICE_BUS_ENABLED                        = var.feature_service_bus_enabled
        DATABASE_NAME                              = var.database_name
        # Specific to Prisma to resolve issues with the way relations are fetched
        QUERY_BATCH_SIZE = 2090
        # Temporary migration variables for Project Updates
        NI_DB_MYSQL_DATABASE = local.existing_secret_refs["applications-service-mysql-database"]
        NI_DB_MYSQL_DIALECT  = local.existing_secret_refs["applications-service-mysql-dialect"]
        NI_DB_MYSQL_HOST     = local.existing_secret_refs["applications-service-mysql-host"]
        NI_DB_MYSQL_PASSWORD = local.existing_secret_refs["applications-service-mysql-password"]
        NI_DB_MYSQL_PORT     = local.existing_secret_refs["applications-service-mysql-port"]
        NI_DB_MYSQL_USERNAME = local.existing_secret_refs["applications-service-mysql-username"]
      }
    }

    back_office_appeals_frontend = {
      app_name                   = "appeals-wfe"
      front_door_restriction     = true
      image_name                 = "back-office/appeals-web"
      inbound_vnet_connectivity  = false
      integration_subnet_id      = var.integration_subnet_id
      key_vault_access           = true
      outbound_vnet_connectivity = true
      action_group_ids           = local.bo_appeals_action_group_ids

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING      = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/back-office-appeals-insights-connection-string/)"
        ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
        AUTH_REDIRECT_PATH                         = "/auth/redirect"
        API_HOST                                   = "https://pins-app-${var.service_name}-appeals-api-${var.resource_suffix}.azurewebsites.net"
        APP_HOSTNAME                               = var.back_office_appeals_hostname
        AUTH_CLIENT_ID                             = var.azuread_auth_client_id
        AUTH_CLIENT_SECRET                         = local.secret_refs["back-office-client-secret"]
        AUTH_CLOUD_INSTANCE_ID                     = "https://login.microsoftonline.com"
        AUTH_TENANT_ID                             = data.azurerm_client_config.current.tenant_id
        APPEALS_INSPECTOR_GROUP_ID                 = var.azuread_appeals_inspector_group_id
        APPEALS_CASE_OFFICER_GROUP_ID              = var.azuread_appeals_case_officer_group_id
        APPEALS_LEGAL_TEAM_GROUP_ID                = var.azuread_appeals_legal_team_group_id
        APPEALS_CS_TEAM_GROUP_ID                   = var.azuread_appeals_cs_team_group_id
        AZURE_BLOB_STORE_HOST                      = var.bo_appeals_storage_account_endpoint
        AZURE_BLOB_DEFAULT_CONTAINER               = var.bo_appeals_document_container_name
        LOG_LEVEL_FILE                             = var.back_office_appeals_log_level_file
        LOG_LEVEL_STDOUT                           = var.back_office_appeals_log_level_stdout
        NODE_ENV                                   = var.node_environment
        REDIS_CONNECTION_STRING                    = local.existing_secret_refs[var.back_office_appeals_redis_connection_string_secret_name]
        SESSION_SECRET                             = local.secret_refs["session-secret"] # TODO: Let's create a separate one for Appeals
      }
    }

    back_office_appeals_api = {
      app_name                        = "appeals-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "back-office/back-office-appeals-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true
      action_group_ids                = local.bo_appeals_action_group_ids

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING      = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/back-office-appeals-insights-connection-string/)"
        ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
        DATABASE_URL                               = var.appeals_database_connection_string
        DATABASE_NAME                              = var.appeals_database_name
        SRV_HORIZON_URL                            = var.horizon_url
        MOCK_HORIZON                               = var.mock_horizon
        NODE_ENV                                   = var.node_environment
        SERVICE_BUS_HOSTNAME                       = "${var.service_bus_namespace_name}.servicebus.windows.net"
        SERVICE_BUS_ENABLED                        = var.feature_service_bus_enabled
        GOV_NOTIFY_API_KEY                         = local.secret_refs["back-office-appeals-gov-notify-api-key"]
        TEST_MAILBOX                               = local.secret_refs["back-office-appeals-test-mailbox"]
        BO_BLOB_STORAGE_ACCOUNT                    = var.bo_appeals_storage_account_endpoint
        BO_BLOB_CONTAINER                          = var.bo_appeals_document_container_name
      }
    }
  }

  secret_names = [
    "back-office-client-secret",
    "back-office-topic-key",
    "os-places-api-key",
    "session-secret",
    "back-office-appeals-gov-notify-api-key",
    "back-office-appeals-test-mailbox",
    "back-office-applications-gov-notify-api-key"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }

  # These are secrets we don't intend to create, but just need a reference to
  existing_secret_names = [
    # created as part of redis cache setup
    var.back_office_applications_redis_connection_string_secret_name,
    var.back_office_appeals_redis_connection_string_secret_name,
    "applications-service-encryption-secret-key",
    "back-office-gov-notify-api-key",
    # Secrets owned by the applications service, soon to be replaced with our own
    "applications-service-mysql-database",
    "applications-service-mysql-dialect",
    "applications-service-mysql-host",
    "applications-service-mysql-password",
    "applications-service-mysql-port",
    "applications-service-mysql-username",
    # This would ideally be in the secret_names list, but there's no way to add a value to the secret generation loop
    "back-office-sql-connection-string-admin",
    "back-office-sql-connection-string-app",
  ]

  existing_secret_refs = {
    for name in local.existing_secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }

  # action group id objects for passing to node-app-service module
  bo_applications_action_group_ids = {
    tech            = var.action_group_ids.bo_applications_tech,
    service_manager = var.action_group_ids.bo_applications_service_manager,
    iap             = var.action_group_ids.iap,
    its             = var.action_group_ids.its,
    info_sec        = var.action_group_ids.info_sec
  }

  # action group id object for passing to node-app-service module
  bo_appeals_action_group_ids = {
    tech            = var.action_group_ids.bo_appeals_tech,
    service_manager = var.action_group_ids.bo_appeals_service_manager,
    iap             = var.action_group_ids.iap,
    its             = var.action_group_ids.its,
    info_sec        = var.action_group_ids.info_sec
  }
}
