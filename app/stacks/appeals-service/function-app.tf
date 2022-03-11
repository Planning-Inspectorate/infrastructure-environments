resource "azurerm_function_app" "horizon_add_document" {
  #checkov:skip=CKV_AZURE_56: Authenticatino not required
  name                       = "pins-func-add-document-${local.service_name}-${local.resource_suffix}"
  location                   = azurerm_resource_group.appeals_service_stack.location
  resource_group_name        = azurerm_resource_group.appeals_service_stack.name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = azurerm_storage_account.function_apps.name
  storage_account_access_key = azurerm_storage_account.function_apps.primary_access_key
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
    value = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.primary_connection_string
    type  = "custom"
  }

  tags = local.tags
}

resource "azurerm_function_app" "horizon_create_contact" {
  #checkov:skip=CKV_AZURE_56: Authenticatino not required
  name                       = "pins-func-create-contact-${local.service_name}-${local.resource_suffix}"
  location                   = azurerm_resource_group.appeals_service_stack.location
  resource_group_name        = azurerm_resource_group.appeals_service_stack.name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = azurerm_storage_account.function_apps.name
  storage_account_access_key = azurerm_storage_account.function_apps.primary_access_key
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
    value = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.primary_connection_string
    type  = "custom"
  }

  tags = local.tags
}

resource "azurerm_function_app" "horizon_householder_appeal_publish" {
  #checkov:skip=CKV_AZURE_56: Authenticatino not required
  name                       = "pins-func-appeal-publish-${local.service_name}-${local.resource_suffix}"
  location                   = azurerm_resource_group.appeals_service_stack.location
  resource_group_name        = azurerm_resource_group.appeals_service_stack.name
  app_service_plan_id        = var.app_service_plan_id
  https_only                 = true
  storage_account_name       = azurerm_storage_account.function_apps.name
  storage_account_access_key = azurerm_storage_account.function_apps.primary_access_key
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
    value = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.primary_connection_string
    type  = "custom"
  }

  tags = local.tags
}
