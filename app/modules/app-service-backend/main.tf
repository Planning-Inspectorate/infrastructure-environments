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
    ftps_state                           = "FtpsOnly"
    http2_enabled                        = true
    linux_fx_version                     = "DOCKER|${var.container_registry_login_server}/${var.container_image}:${var.container_image_tag}"
  }

  app_settings = merge({
    DOCKER_ENABLE_CI = var.enable_cd
    },
    var.app_settings
  )

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  role_definition_name = "AcrPull"
  scope                = var.container_registry_id
  principal_id         = azurerm_app_service.app_service.identity[0].principal_id
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "${azurerm_app_service.app_service.name}-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.app_service.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
