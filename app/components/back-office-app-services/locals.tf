locals {
  app_services = {
    back_office_frontend = {
      app_name                   = "wfe"
      image_name                 = "back-office/back-office-web"
      inbound_vnet_connectivity  = false
      integration_subnet_id      = var.integration_subnet_id
      key_vault_access           = false
      outbound_vnet_connectivity = true

      app_settings = {
        API_HOST = "https://pins-app-${var.service_name}-api-${var.resource_suffix}.azurewebsites.net"
        NODE_ENV = var.node_environment
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
}
