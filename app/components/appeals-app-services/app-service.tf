#====================================
# Frontends
#====================================

module "appeals_frontend" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeals-wfe"
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

  }

  tags = var.tags
}

#====================================
# Backends
#====================================

module "appeals_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "appeals-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = var.endpoint_subnet_id
  inbound_vnet_connectivity          = true
  integration_subnet_id              = var.integration_subnet_id
  key_vault_id                       = var.key_vault_id
  location                           = var.location
  outbound_vnet_connectivity         = true
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  app_settings = {
    APP_APPEALS_BASE_URL                                                        = var.appeals_service_public_url
    DOCS_API_PATH                                                               = "/opt/app/api"
    DOCUMENTS_SERVICE_API_TIMEOUT                                               = "10000"
    DOCUMENTS_SERVICE_API_URL                                                   = "https://${module.appeal_documents_service_api.default_site_hostname}"
    FEATURE_FLAG_NEW_APPEAL_JOURNEY                                             = true
    HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                                  = true
    HORIZON_HAS_PUBLISHER_HOST                                                  = "${azurerm_servicebus_namespace.horizon.name}.servicebus.windows.net"
    HORIZON_HAS_PUBLISHER_PASSWORD                                              = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.primary_connection_string
    HORIZON_HAS_PUBLISHER_PORT                                                  = "5671"
    HORIZON_HAS_PUBLISHER_QUEUE                                                 = azurerm_servicebus_queue.horizon_householder_appeal_publish.name
    HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT                                       = "5"
    HORIZON_HAS_PUBLISHER_TRANSPORT                                             = "tls"
    HORIZON_HAS_PUBLISHER_USERNAME                                              = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.name
    LOGGER_LEVEL                                                                = var.logger_level
    LPA_DATA_PATH                                                               = "/opt/app/data/lpa-list.csv"
    LPA_TRIALIST_DATA_PATH                                                      = "/opt/app/data/lpa-trialists.json"
    MONGODB_AUTO_INDEX                                                          = true
    MONGODB_NAME                                                                = "appeals-service-api"
    MONGODB_URL                                                                 = var.cosmosdb_connection_string
    NODE_ENV                                                                    = var.node_environment
    SERVER_PORT                                                                 = "3000"
    SERVER_SHOW_ERRORS                                                          = true
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS                                     = "0"
    SRV_NOTIFY_API_KEY                                                          = var.key_vault_secret_refs["srv-notify-api-key"]
    SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID    = var.srv_notify_appeal_submission_confirmation_email_to_apellant_template_id
    SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID = var.srv_notify_appeal_submission_received_notification_email_to_lpa_template_id
    SRV_NOTIFY_BASE_URL                                                         = var.srv_notify_base_url
    SRV_NOTIFY_EMAIL_REPLYTO_ID_START_EMAIL_TO_LPA                              = var.srv_notify_email_reply_to_id_start_email_to_lpa_template_id
    SRV_NOTIFY_SERVICE_ID                                                       = var.srv_notify_service_id
    SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID                                   = var.srv_notify_start_email_to_lpa_template_id
    SRV_NOTIFY_TEMPLATE_ID                                                      = var.srv_notify_template_id
  }

  tags = var.tags
}

module "appeal_documents_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "documents-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = var.endpoint_subnet_id
  inbound_vnet_connectivity          = true
  integration_subnet_id              = var.integration_subnet_id
  location                           = var.location
  outbound_vnet_connectivity         = true
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  app_settings = {
    BLOB_STORAGE_CONNECTION_STRING      = ""
    DOCS_API_PATH                       = "/opt/app/api"
    FILE_MAX_SIZE_IN_BYTES              = "15000000"
    FILE_UPLOAD_PATH                    = "/tmp/upload"
    LOGGER_LEVEL                        = "debug"
    MONGODB_AUTO_INDEX                  = "true"
    MONGODB_DB_NAME                     = ""
    MONGODB_URL                         = var.cosmosdb_connection_string
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

  tags = var.tags
}

module "pdf_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "pdf-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = var.endpoint_subnet_id
  inbound_vnet_connectivity          = true
  location                           = var.location
  outbound_vnet_connectivity         = false
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  app_settings = {

  }

  tags = var.tags
}

module "clam_av_service_api" {
  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = "clamav-api"
  app_service_private_dns_zone_id    = var.app_service_private_dns_zone_id
  app_service_plan_id                = var.app_service_plan_id
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = var.endpoint_subnet_id
  inbound_vnet_connectivity          = true
  location                           = var.location
  outbound_vnet_connectivity         = false
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  app_settings = {

  }

  tags = var.tags
}
