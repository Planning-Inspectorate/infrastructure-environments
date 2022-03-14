module "applications_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "applications-wfe"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  inbound_vnet_connectivity          = false
  integration_subnet_id              = var.integration_subnet_id
  location                           = var.location
  outbound_vnet_connectivity         = true
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  app_settings = {
    APPLICATIONS_SERVICE_API_TIMEOUT = var.api_timeout
    APPLICATIONS_SERVICE_API_URL     = "https://${module.applications_service_api.default_site_hostname}"
    GOOGLE_ANALYTICS_ID              = var.google_analytics_id
    HOST_URL                         = var.applications_service_public_url
    SESSION_KEY                      = "some_key"
    SUBDOMAIN_OFFSET                 = "3"
    USE_SECURE_SESSION_COOKIES       = true
  }

  tags = var.tags
}

module "applications_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "applications-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = var.endpoint_subnet_id
  key_vault_id                       = var.key_vault_id
  inbound_vnet_connectivity          = true
  integration_subnet_id              = var.integration_subnet_id
  location                           = var.location
  outbound_vnet_connectivity         = true
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

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

  tags = var.tags
}
