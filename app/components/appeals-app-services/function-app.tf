resource "azurerm_function_app" "horizon_add_document" {
  #checkov:skip=CKV_AZURE_56: Authentication not required
  name                       = "pins-func-add-document-${var.service_name}-${var.resource_suffix}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = var.function_apps_storage_account
  storage_account_access_key = var.function_apps_storage_account_primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {

  }

  site_config {
    always_on                 = true
    http2_enabled             = true
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }

  connection_string {
    name  = "horizon-service-bus"
    type  = "Custom"
    value = azurerm_servicebus_namespace.horizon.default_primary_connection_string
  }

  tags = var.tags
}

resource "azurerm_function_app" "horizon_create_contact" {
  #checkov:skip=CKV_AZURE_56: Authenticatino not required
  name                       = "pins-func-create-contact-${var.service_name}-${var.resource_suffix}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = var.function_apps_storage_account
  storage_account_access_key = var.function_apps_storage_account_primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {

  }

  site_config {
    always_on                 = true
    http2_enabled             = true
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }

  connection_string {
    name  = "horizon-service-bus"
    type  = "Custom"
    value = azurerm_servicebus_namespace.horizon.default_primary_connection_string
  }

  tags = var.tags
}

resource "azurerm_function_app" "horizon_householder_appeal_publish" {
  #checkov:skip=CKV_AZURE_56: Authenticatino not required
  name                       = "pins-func-appeal-publish-${var.service_name}-${var.resource_suffix}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = var.function_apps_storage_account
  storage_account_access_key = var.function_apps_storage_account_primary_access_key
  os_type                    = "linux"
  version                    = "~3"

  app_settings = {

  }

  site_config {
    always_on                 = true
    http2_enabled             = true
    linux_fx_version          = "node|14"
    use_32_bit_worker_process = false
  }

  connection_string {
    name  = "horizon-service-bus"
    type  = "Custom"
    value = azurerm_servicebus_namespace.horizon.default_primary_connection_string
  }

  tags = var.tags
}
