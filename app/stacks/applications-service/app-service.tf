module "national_infrastructure_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "ni-wfe"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  inbound_vnet_connectivity          = false
  integration_subnet_id              = var.integration_subnet_id
  location                           = azurerm_resource_group.applications_service_stack.location
  outbound_vnet_connectivity         = true
  resource_group_name                = azurerm_resource_group.applications_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    APPLICATIONS_SERVICE_API_TIMEOUT = var.api_timeout
    APPLICATIONS_SERVICE_API_URL     = module.national_infrastructure_service.default_site_hostname
    GOOGLE_ANALYTICS_ID              = var.google_analytics_id
    HOST_URL                         = local.frontend_url
    SESSION_KEY                      = "some_key"
    SUBDOMAIN_OFFSET                 = "3"
    USE_SECURE_SESSION_COOKIES       = true
  }

  tags = local.tags
}

module "national_infrastructure_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "ni-api"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.applicatons_service_ingress.id
  inbound_vnet_connectivity          = true
  private_dns_zone_id                = var.private_dns_zone_id
  location                           = azurerm_resource_group.applications_service_stack.location
  outbound_vnet_connectivity         = false
  resource_group_name                = azurerm_resource_group.applications_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    ENCRYPTION_SECRET_KEY                               = var.key_vault_secret_refs["applications-service-encryption-secret-key"]
    HAVING_YOUR_SAY_URL                                 = "${local.frontend_url}having-your-say-guide"
    LOGGER_LEVEL                                        = var.logger_level
    MAGIC_LINK_DOMAIN                                   = local.frontend_url
    MYSQL_DATABASE                                      = var.mysql_database
    MYSQL_DIALECT                                       = "mysql"
    MYSQL_HOST                                          = var.key_vault_secret_refs["applications-service-mysql-host"]
    MYSQL_PASSWORD                                      = var.key_vault_secret_refs["applications-service-mysql-password"]
    MYSQL_PORT                                          = "3306"
    MYSQL_USERNAME                                      = var.key_vault_secret_refs["applications-service-mysql-username"]
    NODE_ENV                                            = var.node_environment
    PRELIMINARY_MEETING_URL                             = local.frontend_url
    SERVER_PORT                                         = "3000"
    SERVER_SHOW_ERRORS                                  = true
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS             = "0"
    SRV_NOTIFY_API_KEY                                  = var.key_vault_secret_refs["srv-notify-api-key"]
    SRV_NOTIFY_BASE_URL                                 = "https://api.notifications.service.gov.uk/"
    SRV_NOTIFY_IP_REGISTRATION_CONFIRMATION_EMAIL_TO_IP = "830c9c01-1f81-4198-be72-11ab173c128a"
    SRV_NOTIFY_MAGIC_LINK_EMAIL                         = "4ca6b93a-4c45-4abe-a8ea-69ba13c80915"
    SRV_NOTIFY_SERVICE_ID                               = "9b89eb93-3071-432c-9c6b-4e07dbda9071"
  }

  tags = local.tags
}
