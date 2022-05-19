locals {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = var.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING      = var.app_insights_connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    DOCKER_ENABLE_CI                           = true
    DOCKER_REGISTRY_SERVER_PASSWORD            = data.azurerm_container_registry.acr.admin_password
    DOCKER_REGISTRY_SERVER_URL                 = data.azurerm_container_registry.acr.login_server
    DOCKER_REGISTRY_SERVER_USERNAME            = data.azurerm_container_registry.acr.admin_username
    XDT_MicrosoftApplicationInsights_Mode      = "default"
    XDT_MicrosoftApplicationInsights_NodeJS    = "1"
  }
}
