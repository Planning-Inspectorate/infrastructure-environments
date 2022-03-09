#====================================
# Frontends
#====================================

module "appeal_service_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeals-wfe"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  inbound_vnet_connectivity          = false
  integration_subnet_id              = var.integration_subnet_id
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = true
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {

  }

  tags = local.tags
}

#====================================
# Backends
#====================================

module "appeal_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeal-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  integration_subnet_id              = var.integration_subnet_id
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = true
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {

  }

  tags = local.tags
}

module "appeal_documents_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "documents-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  integration_subnet_id              = var.integration_subnet_id
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = true
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    BLOB_STORAGE_CONNECTION_STRING      = ""
    DOCS_API_PATH                       = "/opt/app/api"
    FILE_MAX_SIZE_IN_BYTES              = "15000000"
    FILE_UPLOAD_PATH                    = "/tmp/upload"
    LOGGER_LEVEL                        = "debug"
    MONGODB_AUTO_INDEX                  = "true"
    MONGODB_DB_NAME                     = ""
    MONGODB_URL                         = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
    NODE_ENV                            = "production"
    SERVER_PORT                         = "4000",
    SERVER_SHOW_ERRORS                  = "true"
    STORAGE_CONTAINER_NAME              = "uploads"
    STORAGE_UPLOAD_MAX_ATTEMPTS         = "3"
    STORAGE_UPLOAD_QUERY_LIMIT          = "5"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS  = "28"
    WEBSITES_CONTAINER_START_TIME_LIMIT = "50000"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    WEBSITES_PORT                       = "4000"
  }

  tags = local.tags
}

module "pdf_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "pdf-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {

  }

  tags = local.tags
}

module "clam_av_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "clamav-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {

  }

  tags = local.tags
}
