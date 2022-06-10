resource "azurerm_linux_web_app" "web_app" {
  name                = "pins-app-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  client_certificate_enabled = false
  https_only                 = true

  app_settings = merge(var.app_settings, local.app_settings)

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
      docker_image     = "${data.azurerm_container_registry.acr.login_server}/${var.image_name}"
      docker_image_tag = "main"
    }

    dynamic "ip_restriction" {
      for_each = var.front_door_restriction ? [1] : []

      content {
        name        = "FrontDoorInbound"
        service_tag = "AzureFrontDoor.Backend"
        action      = "Allow"
        priority    = 100
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      site_config["application_stack"]
    ]
  }
}

resource "azurerm_linux_web_app_slot" "staging" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.web_app.id

  client_certificate_enabled = false
  https_only                 = true

  app_settings = merge(var.app_settings, local.app_settings)

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
      docker_image     = "${data.azurerm_container_registry.acr.login_server}/${var.image_name}"
      docker_image_tag = "main"
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      site_config["application_stack"]
    ]
  }
}

resource "azurerm_app_service_certificate" "custom_hostname" {
  count = var.custom_hostname != null ? 1 : 0

  name                = var.custom_hostname
  resource_group_name = var.app_service_plan_resource_group_name
  location            = var.location
  key_vault_secret_id = var.custom_hostname_certificate_secret_id

  tags = var.tags
}

resource "azurerm_app_service_custom_hostname_binding" "custom_hostname" {
  count = var.custom_hostname != null ? 1 : 0

  hostname            = var.custom_hostname
  app_service_name    = azurerm_linux_web_app.web_app.name
  resource_group_name = var.resource_group_name
  ssl_state           = "SniEnabled"
  thumbprint          = azurerm_app_service_certificate.custom_hostname[0].thumbprint
}

resource "azurerm_private_endpoint" "private_endpoint" {
  count = var.inbound_vnet_connectivity ? 1 : 0

  name                = "pins-pe-${var.service_name}-${var.app_name}-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.endpoint_subnet_id

  private_dns_zone_group {
    name                 = "appserviceprivatednszone"
    private_dns_zone_ids = [var.app_service_private_dns_zone_id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_linux_web_app.web_app.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_connection" {
  count = var.outbound_vnet_connectivity ? 1 : 0

  app_service_id = azurerm_linux_web_app.web_app.id
  subnet_id      = var.integration_subnet_id
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "vnet_connection" {
  count = var.outbound_vnet_connectivity ? 1 : 0

  app_service_id = azurerm_linux_web_app.web_app.id
  slot_name      = "staging"
  subnet_id      = var.integration_subnet_id
}

resource "azurerm_key_vault_access_policy" "read_secrets" {
  count = var.key_vault_id != null ? 1 : 0

  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_linux_web_app.web_app.identity.0.principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}
