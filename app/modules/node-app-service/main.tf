resource "azurerm_app_service" "app_service" {
  #checkov:skip=CKV_AZURE_13: App service authentication not required
  #checkov:skip=CKV_AZURE_17: Client cert requirement disabled as we have frontend apps
  #checkov:skip=CKV_AZURE_80: .Net not required
  #checkov:skip=CKV_AZURE_88: App service does not use Storage accounts
  name                = "pins-app-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  client_cert_enabled = false
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
    always_on     = "true"
    ftps_state    = "FtpsOnly"
    http2_enabled = true

    dynamic "ip_restriction" {
      for_each = var.inbound_vnet_connectivity == false ? [1] : []
      content {
        name        = "FrontDoorInbound"
        service_tag = "AzureFrontDoor.Backend"
        action      = "Allow"
        priority    = 100
      }
    }
  }

  app_settings = merge(
    var.app_settings,
    {
      APPINSIGHTS_INSTRUMENTATIONKEY             = var.app_insights_instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING      = var.app_insights_connection_string
      ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
      DOCKER_REGISTRY_SERVER_PASSWORD            = var.container_registry_server_password
      DOCKER_REGISTRY_SERVER_URL                 = var.container_registry_login_server
      DOCKER_REGISTRY_SERVER_USERNAME            = var.container_registry_server_username
      XDT_MicrosoftApplicationInsights_Mode      = "default"
      XDT_MicrosoftApplicationInsights_NodeJS    = "1"
    }
  )

  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint" {
  count = var.inbound_vnet_connectivity == true ? 1 : 0

  name                = "pins-pe-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.endpoint_subnet_id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [var.app_service_private_dns_zone_id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.app_service.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  count = var.outbound_vnet_connectivity == true ? 1 : 0

  app_service_id = azurerm_app_service.app_service.id
  subnet_id      = var.integration_subnet_id
}
