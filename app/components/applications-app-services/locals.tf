locals {
  app_services = {
    applications_frontend = {
      app_name                   = "applications-wfe"
      inbound_vnet_connectivity  = false
      key_vault_access           = false
      outbound_vnet_connectivity = true

      app_settings = {
        APPLICATIONS_SERVICE_API_TIMEOUT = var.api_timeout
        APPLICATIONS_SERVICE_API_URL     = "https://pins-app-${var.service_name}-applications-api-${var.resource_suffix}.azurewebsites.net/"
        GOOGLE_ANALYTICS_ID              = var.google_analytics_id
        HOST_URL                         = var.applications_service_public_url
        SESSION_KEY                      = "some_key"
        SUBDOMAIN_OFFSET                 = "3"
        USE_SECURE_SESSION_COOKIES       = true
      }
    }

    applications_service_api = {
      app_name                        = "applications-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.endpoint_subnet_id
      inbound_vnet_connectivity       = true
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        ENCRYPTION_SECRET_KEY                               = var.key_vault_secret_refs["applications-service-encryption-secret-key"]
        HAVING_YOUR_SAY_URL                                 = "${var.applications_service_public_url}having-your-say-guide"
        LOGGER_LEVEL                                        = var.logger_level
        MAGIC_LINK_DOMAIN                                   = var.applications_service_public_url
        MYSQL_DATABASE                                      = var.key_vault_secret_refs["applications-service-mysql-database"]
        MYSQL_DIALECT                                       = var.key_vault_secret_refs["applications-service-mysql-dialect"]
        MYSQL_HOST                                          = var.key_vault_secret_refs["applications-service-mysql-host"]
        MYSQL_PASSWORD                                      = var.key_vault_secret_refs["applications-service-mysql-password"]
        MYSQL_PORT                                          = var.key_vault_secret_refs["applications-service-mysql-port"]
        MYSQL_USERNAME                                      = var.key_vault_secret_refs["applications-service-mysql-username"]
        NODE_ENV                                            = var.node_environment
        PRELIMINARY_MEETING_URL                             = var.applications_service_public_url
        SERVER_PORT                                         = "3000"
        SERVER_SHOW_ERRORS                                  = true
        SERVER_TERMINATION_GRACE_PERIOD_SECONDS             = "0"
        SRV_NOTIFY_API_KEY                                  = var.key_vault_secret_refs["srv-notify-api-key"]
        SRV_NOTIFY_BASE_URL                                 = var.srv_notify_base_url
        SRV_NOTIFY_IP_REGISTRATION_CONFIRMATION_EMAIL_TO_IP = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
        SRV_NOTIFY_MAGIC_LINK_EMAIL                         = var.srv_notify_magic_link_email_template_id
        SRV_NOTIFY_SERVICE_ID                               = var.srv_notify_service_id
      }
    }
  }
}
