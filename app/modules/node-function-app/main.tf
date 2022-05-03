resource "azurerm_linux_function_app" "function_app" {
  name                       = "pins-func-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.app_service_plan_id
  storage_account_name       = var.function_apps_storage_account
  storage_account_access_key = var.function_apps_storage_account_access_key
  https_only                 = true

  app_settings = var.app_settings

  dynamic "connection_string" {
    for_each = var.connection_strings

    content {
      name  = connection_string.value["name"]
      type  = connection_string.value["type"]
      value = connection_string.value["value"]
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
