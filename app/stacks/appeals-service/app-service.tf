#====================================
# Frontends
#====================================

module "lpa_questionnaire_frontend" {
  source = "../../modules/app-service-frontend"

  app_name                        = "${local.prefix}-lpa-questionnaire-web-app"
  app_service_plan_id             = var.app_service_plan_id
  container_image                 = "lpa-questionnaire-web-app"
  container_image_tag             = "latest"
  container_registry_login_server = data.azurerm_container_registry.odt.login_server
  location                        = azurerm_resource_group.appeals_service_stack.location
  prefix                          = local.prefix
  resource_group_name             = azurerm_resource_group.appeals_service_stack.name
  subnet_id                       = azurerm_subnet.integration_subnet.id

  app_settings = {}

  tags = var.common_tags
}

#====================================
# Backends
#====================================

module "appeals_service_api" {
  source = "../../modules/app-service-backend"

  app_name                        = "${local.prefix}-appeals-service-api"
  app_service_plan_id             = var.app_service_plan_id
  container_image                 = "appsvc-tutorial-custom-image"
  container_image_tag             = "latest"
  container_registry_id           = data.azurerm_container_registry.odt.id
  container_registry_login_server = data.azurerm_container_registry.odt.login_server
  location                        = azurerm_resource_group.appeals_service_stack.location
  prefix                          = local.prefix
  private_dns_zone_id             = azurerm_private_dns_zone.private_link.id
  resource_group_name             = azurerm_resource_group.appeals_service_stack.name
  subnet_id                       = azurerm_subnet.endpoint_subnet.id
  virtual_network_id              = azurerm_virtual_network.appeals_service.id

  app_settings = {
    LPA_DATA_PATH                                                               = ""
    LPA_TRIALIST_DATA_PATH                                                      = ""
    MONGODB_URL                                                                 = var.mongodb_url
    MONGODB_DB_NAME                                                             = ""
    DOCS_API_PATH                                                               = ""
    DOCUMENTS_SERVICE_API_TIMEOUT                                               = ""
    DOCUMENTS_SERVICE_API_URL                                                   = ""
    LOGGER_LEVEL                                                                = ""
    HORIZON_HAS_PUBLISHER_HOST                                                  = ""
    HORIZON_HAS_PUBLISHER_HOSTNAME                                              = ""
    HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT                                       = ""
    HORIZON_HAS_PUBLISHER_PASSWORD                                              = ""
    HORIZON_HAS_PUBLISHER_PORT                                                  = ""
    HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                                  = ""
    HORIZON_HAS_PUBLISHER_TRANSPORT                                             = ""
    HORIZON_HAS_PUBLISHER_USERNAME                                              = ""
    HORIZON_HAS_PUBLISHER_QUEUE                                                 = ""
    SQL_HASAPPEALS_PUBLISHER_HOST                                               = ""
    SQL_HASAPPEALS_PUBLISHER_HOSTNAME                                           = ""
    SQL_HASAPPEALS_PUBLISHER_RECONNECT_LIMIT                                    = ""
    SQL_HASAPPEALS_PUBLISHER_PASSWORD                                           = ""
    SQL_HASAPPEALS_PUBLISHER_PORT                                               = ""
    SQL_HASAPPEALS_PUBLISHER_ATTEMPT_RECONNECTION                               = ""
    SQL_HASAPPEALS_PUBLISHER_TRANSPORT                                          = ""
    SQL_HASAPPEALS_PUBLISHER_USERNAME                                           = ""
    SQL_HASAPPEALS_PUBLISHER_QUEUE                                              = ""
    SERVER_PORT                                                                 = ""
    SERVER_SHOW_ERRORS                                                          = ""
    SERVER_TERMINATION_GRACE_PERIOD_SECONDS                                     = ""
    SRV_HORIZON_URL                                                             = ""
    SRV_NOTIFY_BASE_URL                                                         = ""
    SRV_NOTIFY_SERVICE_ID                                                       = ""
    SRV_NOTIFY_API_KEY                                                          = ""
    SRV_NOTIFY_TEMPLATE_ID                                                      = ""
    SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID    = ""
    SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID = ""
    SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID                                   = ""
    SRV_NOTIFY_EMAIL_REPLYTO_ID_START_EMAIL_TO_LPA                              = ""
    SRV_OS_PLACES_KEY                                                           = ""
    SRV_OS_PLACES_URL                                                           = ""
    APP_APPEALS_BASE_URL                                                        = ""
    APP_LPA_QUESTIONNAIRE_BASE_URL                                              = ""
    WEBSITES_PORT                                                               = 8000
  }

  tags = var.common_tags
}
