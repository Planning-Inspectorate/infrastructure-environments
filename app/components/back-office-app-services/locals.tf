locals {
  app_services = {
    back_office_frontend = {
      app_name                              = "wfe"
      custom_hostname                       = var.custom_hostname
      custom_hostname_certificate_secret_id = var.custom_hostname_certificate_secret_id
      custom_hostname_enabled               = true
      image_name                            = "back-office/back-office-web"
      inbound_vnet_connectivity             = false
      integration_subnet_id                 = var.integration_subnet_id
      key_vault_access                      = true
      outbound_vnet_connectivity            = true

      app_settings = {
        API_HOST                        = "https://pins-app-${var.service_name}-api-${var.resource_suffix}.azurewebsites.net"
        AUTH_CASEOFFICER_GROUP_ID       = var.azuread_auth_case_officer_group_id
        AUTH_CLIENT_ID                  = var.azuread_auth_client_id
        AUTH_CLIENT_SECRET              = local.secret_refs["back-office-client-secret"]
        AUTH_CLOUD_INSTANCE_ID          = "https://login.microsoftonline.com"
        AUTH_INSPECTOR_GROUP_ID         = var.azuread_auth_inspector_group_id
        AUTH_REDIRECT_URI               = "/auth/redirect"
        AUTH_TENANT_ID                  = data.azurerm_client_config.current.tenant_id
        AUTH_VALIDATIONOFFICER_GROUP_ID = var.azuread_auth_validation_office_group_id
        NODE_ENV                        = var.node_environment
      }
    }

    back_office_api = {
      app_name                        = "api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.endpoint_subnet_id
      image_name                      = "back-office/back-office-api"
      inbound_vnet_connectivity       = true
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = false
      outbound_vnet_connectivity      = true

      app_settings = {
        DATABASE_URL = var.database_connection_string
        NODE_ENV     = var.node_environment
      }
    }
  }

  secret_names = [
    "back-office-client-secret"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }
}
