resource "azurerm_linux_function_app" "function_app" {
  name                          = "pins-func-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  service_plan_id               = var.app_service_plan_id
  storage_account_name          = var.function_apps_storage_account
  storage_uses_managed_identity = true

  https_only = true

  app_settings = merge(
    var.app_settings,
    {
      APPINSIGHTS_INSTRUMENTATIONKEY             = var.app_insights_instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING      = var.app_insights_connection_string
      ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
      XDT_MicrosoftApplicationInsights_Mode      = "default"
      XDT_MicrosoftApplicationInsights_NodeJS    = "1"
    }
  )

  dynamic "connection_string" {
    for_each = var.connection_strings
    iterator = connection_string

    content {
      name  = connection_string.name
      type  = connection_string.type
      value = connection_string.value
    }
  }

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                              = true
    application_insights_connection_string = var.app_insights_connection_string
    application_insights_key               = var.app_insights_instrumentation_key
    http2_enabled                          = true

    application_stack {
      node_version = 14
    }
  }

  tags = var.tags
}
