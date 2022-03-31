module "horizon_functions" {
  source = "../../modules/node-function-app"

  action_group_low_id              = var.action_group_low_id
  app_insights_connection_string   = var.app_insights_connection_string
  app_insights_instrumentation_key = var.app_insights_instrumentation_key
  app_name                         = "horizon"
  app_service_plan_id              = var.app_service_plan_id
  function_apps_storage_account    = var.function_apps_storage_account
  location                         = var.location
  monitoring_alerts_enabled        = var.monitoring_alerts_enabled
  resource_group_name              = var.resource_group_name
  resource_suffix                  = var.resource_suffix
  service_name                     = var.service_name

  app_settings = {
    APPEALS_SERVICE_URL  = "https://pins-app-${var.service_name}-appeals-api-${var.resource_suffix}.azurewebsites.net"
    DOCUMENT_SERVICE_URL = "https://pins-app-${var.service_name}-documents-api-${var.resource_suffix}.azurewebsites.net"
    HORIZON_URL          = var.horizon_url
  }

  connection_strings = [
    {
      name  = "horizon-service-bus"
      type  = "Custom"
      value = azurerm_servicebus_namespace.horizon.default_primary_connection_string
    }
  ]

  tags = var.tags
}
