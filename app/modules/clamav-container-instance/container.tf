resource "azurerm_container_group" "back_office_containers" {
  #checkov:skip=CKV_AZURE_98: Ensure that Azure Container group is deployed into virtual network
  name                = "back-office-containers-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  dns_name_label      = "clamav-endpoint"
  os_type             = "Linux"
  network_profile_id  = azurerm_network_profile.back_office_clamav.id

  container {
    name   = "clamav"
    image  = "clamav/clamav:latest"
    cpu    = "1"
    memory = "3"

    volume {
      name       = "clamav_db"
      mount_path = "/var/lib/clamav"

      storage_account_key  = azurerm_storage_account.back_office_containers.primary_access_key
      storage_account_name = azurerm_storage_account.back_office_containers.name
      share_name           = azurerm_storage_share.clamav_db.name
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

  tags = var.tags
}
