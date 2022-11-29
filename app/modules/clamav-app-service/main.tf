resource "azurerm_service_plan" "clamav_service_plan" {
  name                = "pins-asp-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = var.service_plan_sku

  tags = var.tags
}

resource "azurerm_linux_web_app" "clamav" {
  name                = "pins-app-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.clamav_service_plan.id

  client_certificate_enabled = false
  https_only                 = true

  app_settings = local.app_settings

  identity {
    type = "SystemAssigned"
  }

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true

    http_logs {
      file_system {
        retention_in_days = 4
        retention_in_mb   = 25
      }
    }
  }

  site_config {
    always_on     = true
    http2_enabled = true

    application_stack {
      docker_image     = "clamav/clamav"
      docker_image_tag = "stable"
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      site_config["application_stack"]
    ]
  }
}

resource "azurerm_private_endpoint" "private_endpoint" {
  count = var.inbound_vnet_connectivity ? 1 : 0

  name                = "pins-pe-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.endpoint_subnet_id

  private_dns_zone_group {
    name                 = "appserviceprivatednszone"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.app_service.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_linux_web_app.clamav.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  count = var.outbound_vnet_connectivity ? 1 : 0

  app_service_id = azurerm_linux_web_app.clamav.id
  subnet_id      = var.back_office_integration_subnet_id
}
