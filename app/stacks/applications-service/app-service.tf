module "national_infrastructure_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "ni-wfe"
  app_service_plan_id                = var.app_service_plan_id
  app_type                           = "frontend"
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  integration_subnet_id              = var.integration_subnet_id
  location                           = azurerm_resource_group.applications_service_stack.location
  resource_group_name                = azurerm_resource_group.applications_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    APPLICATIONS_SERVICE_API_TIMEOUT = var.api_timeout
    APPLICATIONS_SERVICE_API_URL     = module.national_infrastructure_service.default_site_hostname
    GOOGLE_ANALYTICS_ID              = var.google_analytics_id
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
  app_type                           = "backend"
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.applicatons_service_ingress.id
  private_dns_zone_id                = var.private_dns_zone_id
  location                           = azurerm_resource_group.applications_service_stack.location
  resource_group_name                = azurerm_resource_group.applications_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {

  }

  tags = local.tags
}
