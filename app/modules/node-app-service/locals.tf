locals {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = var.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING      = var.app_insights_connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    DOCKER_REGISTRY_SERVER_PASSWORD            = var.container_registry_server_password
    DOCKER_REGISTRY_SERVER_URL                 = var.container_registry_login_server
    DOCKER_REGISTRY_SERVER_USERNAME            = var.container_registry_server_username
    XDT_MicrosoftApplicationInsights_Mode      = "default"
    XDT_MicrosoftApplicationInsights_NodeJS    = "1"
  }
}
