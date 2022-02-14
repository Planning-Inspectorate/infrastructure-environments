resource "azurerm_app_service" "app_service" {
  #checkov:skip=CKV_AZURE_13: App service authentication not required
  #checkov:skip=CKV_AZURE_80: .Net not required
  #checkov:skip=CKV_AZURE_88: App service does not use Storage accounts
  name                = "${var.prefix}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  client_cert_enabled = true
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  logs {
    detailed_error_messages_enabled = true
    failed_request_tracing_enabled  = true

    http_logs {
      file_system {
        retention_in_days = 4
        retention_in_mb   = 25
      }
    }
  }

  site_config {
    acr_use_managed_identity_credentials = true
    always_on                            = "true"
    http2_enabled                        = true
    ftps_state                           = "FtpsOnly"
    linux_fx_version                     = "DOCKER|${var.container_registry_login_server}/${var.container_image}:${var.container_image_tag}"

  }

  app_settings = var.app_settings
  tags         = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  app_service_id = azurerm_app_service.app_service.id
  subnet_id      = var.subnet_id
}
