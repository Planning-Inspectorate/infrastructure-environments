resource "azurerm_container_group" "clamav" {
  #checkov:skip=CKV_AZURE_98: The properties covering this rule are deprecated
  name                = "pins-ci-${var.service_name}-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [var.clamav_subnet_id]

  identity {
    type = "SystemAssigned"
  }

  container {
    name   = "clamav"
    image  = "clamav/clamav:latest_base"
    cpu    = "1"
    memory = "3"

    volume {
      name       = "clamav-db"
      mount_path = "/var/lib/clamav"

      storage_account_key  = azurerm_storage_account.clamav.primary_access_key
      storage_account_name = azurerm_storage_account.clamav.name
      share_name           = azurerm_storage_share.clamav.name
    }

    ports {
      port     = 3310
      protocol = "TCP"
    }

    ports {
      port     = 7357
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 3310
    protocol = "TCP"
  }

  exposed_port {
    port     = 7357
    protocol = "TCP"
  }

  tags = var.tags
}

# storage
resource "azurerm_storage_account" "clamav" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Logging not implemented yet
  #checkov:skip=CKV2_AZURE_8: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  #checkov:skip=CKV_AZURE_59: TODO: Ensure that Storage accounts disallow public access
  #checkov:skip=CKV_AZURE_190: TODO: Ensure that Storage blobs restrict public access
  #checkov:skip=CKV_AZURE_206: Replication not required

  # max length 24, so trim off the end - will only apply to training environment!
  name                     = substr(replace("pinsstclamav${var.resource_suffix}", "-", ""), 0, 24)
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.tags
}

resource "azurerm_storage_share" "clamav" {
  name                 = "clamav-db"
  storage_account_name = azurerm_storage_account.clamav.name
  quota                = 50
}

# networking
resource "azurerm_private_dns_a_record" "clamav" {
  name                = "${var.service_name}-clamav-${var.resource_suffix}"
  zone_name           = data.azurerm_private_dns_zone.internal.name
  resource_group_name = data.azurerm_private_dns_zone.internal.resource_group_name
  ttl                 = 60
  records             = [azurerm_container_group.clamav.ip_address]

  provider = azurerm.tooling
}
