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

      app_settings = {
        AUTH_REDIRECT_PATH                       = "/auth/redirect"
        API_HOST                                 = "https://pins-app-${var.service_name}-api-${var.resource_suffix}.azurewebsites.net"
        APP_HOSTNAME                             = var.back_office_hostname
        APPEALS_CASE_OFFICER_GROUP_ID            = var.azuread_appeals_case_officer_group_id
        AUTH_CLIENT_ID                           = var.azuread_auth_client_id
        AUTH_CLIENT_SECRET                       = local.secret_refs["back-office-client-secret"]
        AUTH_CLOUD_INSTANCE_ID                   = "https://login.microsoftonline.com"
        APPEALS_INSPECTOR_GROUP_ID               = var.azuread_appeals_inspector_group_id
        AUTH_TENANT_ID                           = data.azurerm_client_config.current.tenant_id
        APPEALS_VALIDATION_OFFICER_GROUP_ID      = var.azuread_appeals_validation_officer_group_id
        APPLICATIONS_CASE_ADMIN_OFFICER_GROUP_ID = var.azuread_applications_case_admin_officer_group_id
        APPLICATIONS_CASETEAM_GROUP_ID           = var.azuread_applications_caseteam_group_id
        APPLICATIONS_CASEOFFICER_GROUP_ID        = var.azuread_applications_caseteam_group_id # TO DO: delete when no longer needed
        APPLICATIONS_INSPECTOR_GROUP_ID          = var.azuread_applications_inspector_group_id
        AZURE_BLOB_STORE_HOST                    = var.document_storage_api_host
        NODE_ENV                                 = var.node_environment
        OS_PLACES_API_KEY                        = local.secret_refs["os-places-api-key"]
        SESSION_SECRET                           = local.secret_refs["session-secret"]
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

      app_settings = {
        DATABASE_URL              = var.database_connection_string
        DOCUMENT_STORAGE_API_HOST = "https://pins-app-${var.service_name}-document-storage-api-${var.resource_suffix}.azurewebsites.net"
        DOCUMENT_STORAGE_API_PORT = "3443"
        NODE_ENV                  = var.node_environment
        SERVICE_BUS_HOSTNAME      = "${var.service_bus_namespace_name}.servicebus.windows.net"
        SERVICE_BUS_ENABLED       = var.feature_service_bus_enabled
      }
    }

    # TODO: Let's delete this and make the document storage API a shared library
    back_office_document_storage_api = {
      app_name                        = "document-storage-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "back-office/back-office-document-storage-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        AZURE_BLOB_STORE_HOST      = var.document_storage_api_host
        AZURE_BLOB_STORE_CONTAINER = var.document_storage_back_office_document_service_uploads_container_name
        NODE_ENV                   = var.node_environment
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

      app_settings = {
        AUTH_REDIRECT_PATH = "/auth/redirect"
        API_HOST           = "https://pins-app-${var.service_name}-appeals-api-${var.resource_suffix}.azurewebsites.net"
        APP_HOSTNAME       = "pins-app-${var.service_name}-appeals-wfe-${var.resource_suffix}.azurewebsites.net"
        # This is literally here so tflint doesn't make me remove all of the variables, since it would otherwise be unused
        APP_HOSTNAME_NEW                    = var.back_office_appeals_hostname
        APPEALS_CASE_OFFICER_GROUP_ID       = var.azuread_appeals_case_officer_group_id
        AUTH_CLIENT_ID                      = var.azuread_auth_client_id
        AUTH_CLIENT_SECRET                  = local.secret_refs["back-office-client-secret"]
        AUTH_CLOUD_INSTANCE_ID              = "https://login.microsoftonline.com"
        APPEALS_INSPECTOR_GROUP_ID          = var.azuread_appeals_inspector_group_id
        AUTH_TENANT_ID                      = data.azurerm_client_config.current.tenant_id
        APPEALS_VALIDATION_OFFICER_GROUP_ID = var.azuread_appeals_validation_officer_group_id
        AZURE_BLOB_STORE_HOST               = var.document_storage_api_host # TODO: Replace
        NODE_ENV                            = var.node_environment
        SESSION_SECRET                      = local.secret_refs["session-secret"] # TODO: Let's create a separate one for Appeals
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

      app_settings = {
        DATABASE_URL         = var.appeals_database_connection_string
        NODE_ENV             = var.node_environment
        SERVICE_BUS_HOSTNAME = "${var.service_bus_namespace_name}.servicebus.windows.net"
        SERVICE_BUS_ENABLED  = var.feature_service_bus_enabled
      }
    }
  }

  secret_names = [
    "back-office-client-secret",
    "back-office-topic-key",
    "os-places-api-key",
    "session-secret"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }
}
