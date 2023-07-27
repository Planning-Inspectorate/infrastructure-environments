locals {
  container_name = "turbo-cache"
}

resource "azurerm_storage_account" "turborepo_remote_cache" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  name                     = "pinsturboreporemotecache"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.tags
}

resource "azurerm_storage_container" "turborepo_remote_cache" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = local.container_name
  storage_account_name  = azurerm_storage_account.turborepo_remote_cache.name
  container_access_type = "private"
}

resource "random_password" "turborepo_remote_cache" {
  length           = 32
  special          = true
  override_special = "#&-_+"
  min_lower        = 2
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
}

resource "azurerm_key_vault_secret" "turborepo_remote_cache" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "pins-turborepo-token"
  value        = random_password.turborepo_remote_cache.result

  tags = var.tags
}

resource "azurerm_linux_web_app" "turborepo_remote_cache" {
  #checkov:skip=CKV_AZURE_13: App Service authentication may not be required
  #checkov:skip=CKV_AZURE_17: Disabling FTP(S) to be tested
  #checkov:skip=CKV_AZURE_78: TLS mutual authentication may not be required
  #checkov:skip=CKV_AZURE_88: Azure Files mount may not be required
  location            = var.location
  name                = "pins-turbocache-remote-cache"
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  client_certificate_enabled = false
  https_only                 = true

  app_settings = {
    PORT                  = 80
    TURBO_TOKEN           = sensitive(random_password.turborepo_remote_cache.result)
    ABS_CONNECTION_STRING = sensitive(azurerm_storage_account.turborepo_remote_cache.primary_blob_connection_string)
    STORAGE_PATH          = local.container_name
  }

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
      docker_registry_url = "https://index.docker.io"
      docker_image_name   = "ducktors/turborepo-remote-cache:main"
    }

    # TODO: IP Restriction to PINS + K+C VPNs
  }

  tags = var.tags
}
