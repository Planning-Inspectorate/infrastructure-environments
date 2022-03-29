resource "azurerm_linux_function_app" "horizon_functions" {
  #checkov:skip=CKV_AZURE_56: Authentication not required
  name                          = "pins-func-horizon-${var.service_name}-${var.resource_suffix}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  service_plan_id               = var.app_service_plan_id
  storage_account_name          = var.function_apps_storage_account
  storage_uses_managed_identity = true

  https_only = true

  app_settings = {

  }

  connection_string {
    name  = "horizon-service-bus"
    type  = "Custom"
    value = azurerm_servicebus_namespace.horizon.default_primary_connection_string
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
