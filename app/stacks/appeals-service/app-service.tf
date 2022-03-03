#====================================
# Frontends
#====================================

module "lpa_questionnaire_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "lpaq-wfe"
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
    ALLOW_APPEAL_REPLY_CREATE                = "true"
    APPEAL_REPLY_SERVICE_API_TIMEOUT         = "10000"
    APPEAL_REPLY_SERVICE_API_URL             = module.appeal_reply_service.default_site_hostname
    APPEALS_SERVICE_API_TIMEOUT              = "10000"
    APPEALS_SERVICE_API_URL                  = module.appeal_service.default_site_hostname
    CLAM_AV_HOST                             = "dev-clamav.azurewebsites.net"
    DOCUMENTS_SERVICE_API_TIMEOUT            = "10000"
    DOCUMENTS_SERVICE_API_URL                = module.documents_service.default_site_hostname
    FILE_UPLOAD_DEBUG                        = "false"
    FILE_UPLOAD_MAX_FILE_SIZE_BYTES          = "15000000"
    FILE_UPLOAD_TMP_PATH                     = "/tmp"
    FILE_UPLOAD_USE_TEMP_FILES               = "true"
    JWT_SIGNING_KEY                          = ""
    LOGGER_LEVEL                             = "debug"
    MICROSOFT_PROVIDER_AUTHENTICATION_SECRET = ""
    NODE_ENV                                 = "production"
    PDF_SERVICE_API_URL                      = module.pdf_service.default_site_hostname
    PORT                                     = "3000"
    SESSION_KEY                              = "some_secure_key_goes_here"
    SESSION_MONGODB_COLLECTION               = "sessions"
    SESSION_MONGODB_DB_NAME                  = "lpa-questionnaire-web-app"
    SESSION_MONGODB_URL                      = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
    TOKEN_COOKIE_NAME                        = "authCookie"
    TOKEN_VALIDITY_MILLIS                    = "144400000"
    USE_SECURE_SESSION_COOKIES               = "false"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS       = "28"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE      = "false"
  }

  tags = local.tags
}

#====================================
# Backends
#====================================

module "appeal_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeal-api"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  private_dns_zone_id                = var.private_dns_zone_id
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    APP_APPEALS_BASE_URL                                                        = ""
    APP_LPA_QUESTIONNAIRE_BASE_URL                                              = ""
    DOCS_API_PATH                                                               = ""
    DOCUMENTS_SERVICE_API_TIMEOUT                                               = ""
    DOCUMENTS_SERVICE_API_URL                                                   = ""
    HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                                  = ""
    HORIZON_HAS_PUBLISHER_HOST                                                  = ""
    HORIZON_HAS_PUBLISHER_HOSTNAME                                              = ""
    HORIZON_HAS_PUBLISHER_PASSWORD                                              = ""
    HORIZON_HAS_PUBLISHER_PORT                                                  = ""
    HORIZON_HAS_PUBLISHER_QUEUE                                                 = ""
    HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT                                       = ""
    HORIZON_HAS_PUBLISHER_TRANSPORT                                             = ""
    HORIZON_HAS_PUBLISHER_USERNAME                                              = ""
    LOGGER_LEVEL                                                                = ""
    LPA_DATA_PATH                                                               = ""
    LPA_TRIALIST_DATA_PATH                                                      = ""
    MONGODB_DB_NAME                                                             = ""
    MONGODB_URL                                                                 = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
    SERVER_PORT                                                                 = ""
    SERVER_SHOW_ERRORS                                                          = ""
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS                                     = ""
    SQL_HASAPPEALS_PUBLISHER_ATTEMPT_RECONNECTION                               = ""
    SQL_HASAPPEALS_PUBLISHER_HOST                                               = ""
    SQL_HASAPPEALS_PUBLISHER_HOSTNAME                                           = ""
    SQL_HASAPPEALS_PUBLISHER_PASSWORD                                           = ""
    SQL_HASAPPEALS_PUBLISHER_PORT                                               = ""
    SQL_HASAPPEALS_PUBLISHER_QUEUE                                              = ""
    SQL_HASAPPEALS_PUBLISHER_RECONNECT_LIMIT                                    = ""
    SQL_HASAPPEALS_PUBLISHER_TRANSPORT                                          = ""
    SQL_HASAPPEALS_PUBLISHER_USERNAME                                           = ""
    SRV_HORIZON_URL                                                             = ""
    SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID    = ""
    SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID = ""
    SRV_NOTIFY_API_KEY                                                          = ""
    SRV_NOTIFY_BASE_URL                                                         = ""
    SRV_NOTIFY_EMAIL_REPLYTO_ID_START_EMAIL_TO_LPA                              = ""
    SRV_NOTIFY_SERVICE_ID                                                       = ""
    SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID                                   = ""
    SRV_NOTIFY_TEMPLATE_ID                                                      = ""
    SRV_OS_PLACES_KEY                                                           = ""
    SRV_OS_PLACES_URL                                                           = ""
    WEBSITES_PORT                                                               = 8000
  }

  tags = local.tags
}

module "appeal_reply_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeal-reply-api"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  private_dns_zone_id                = var.private_dns_zone_id
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    APPEALS_SERVICE_API_URL                                          = module.appeal_service.default_site_hostname
    DOCS_API_PATH                                                    = "/opt/app/api"
    DOCUMENTS_SERVICE_API_URL                                        = module.documents_service.default_site_hostname
    HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                       = "true"
    HORIZON_HAS_PUBLISHER_HOST                                       = ""
    HORIZON_HAS_PUBLISHER_HOSTNAME                                   = ""
    HORIZON_HAS_PUBLISHER_PASSWORD                                   = ""
    HORIZON_HAS_PUBLISHER_PORT                                       = "5671"
    HORIZON_HAS_PUBLISHER_QUEUE                                      = "horizon-householder-appeal-publish"
    HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT                            = "1"
    HORIZON_HAS_PUBLISHER_TRANSPORT                                  = "tls"
    HORIZON_HAS_PUBLISHER_USERNAME                                   = ""
    LOGGER_LEVEL                                                     = "info"
    MONGODB_DB_NAME                                                  = ""
    MONGODB_URL                                                      = azurerm_cosmosdb_account.appeals_database.connection_strings[0]
    NODE_ENV                                                         = "production"
    SERVER_PORT                                                      = "3000"
    SERVER_SHOW_ERRORS                                               = "true"
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS                          = "0"
    SQL_LPA_PUBLISHER_ATTEMPT_RECONNECTION                           = "true"
    SQL_LPA_PUBLISHER_HOST                                           = ""
    SQL_LPA_PUBLISHER_HOSTNAME                                       = ""
    SQL_LPA_PUBLISHER_PASSWORD                                       = ""
    SQL_LPA_PUBLISHER_PORT                                           = "5671"
    SQL_LPA_PUBLISHER_QUEUE                                          = "sql-householder-lpa-publish"
    SQL_LPA_PUBLISHER_RECONNECT_LIMIT                                = "5"
    SQL_LPA_PUBLISHER_TRANSPORT                                      = "tls"
    SQL_LPA_PUBLISHER_USERNAME                                       = ""
    SRV_NOTIFY_BASE_URL                                              = "https://api.notifications.service.gov.uk"
    SRV_NOTIFY_EMAIL_REPLYTO_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION = "f1e6c8c5-786e-41ca-9086-10b67f31bc86"
    SRV_NOTIFY_SERVICE_ID                                            = "c46d894e-d10e-4c46-a467-019576cd906a"
    SRV_NOTIFY_TEMPLATE_ID_APPEAL_REPLY_SUBMISSION_CONFIRMATION      = "937b4147-8420-42da-859d-d4a65bdf99bc"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS                               = "28"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE                              = "false"
  }

  tags = local.tags
}

module "documents_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "documents-api"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  private_dns_zone_id                = var.private_dns_zone_id
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

module "pdf_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "pdf-api"
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = data.azurerm_container_registry.acr.login_server
  container_registry_server_password = data.azurerm_container_registry.acr.admin_password
  container_registry_server_username = data.azurerm_container_registry.acr.admin_username
  endpoint_subnet_id                 = azurerm_subnet.appeals_service_ingress.id
  inbound_vnet_connectivity          = true
  location                           = azurerm_resource_group.appeals_service_stack.location
  outbound_vnet_connectivity         = false
  private_dns_zone_id                = var.private_dns_zone_id
  resource_group_name                = azurerm_resource_group.appeals_service_stack.name
  resource_suffix                    = local.resource_suffix
  service_name                       = local.service_name

  app_settings = {
    DOCS_API_PATH                           = "/opt/app/api"
    GOTENBERG_URL                           = "http://gotenberg:4000"
    LOGGER_LEVEL                            = "debug"
    NODE_ENV                                = "production"
    SERVER_PORT                             = "3000"
    SERVER_SHOW_ERRORS                      = "true"
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS = "0"
    WEBSITE_HTTPLOGGING_RETENTION_DAYS      = "28"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE     = "false"
  }

  tags = local.tags
}
