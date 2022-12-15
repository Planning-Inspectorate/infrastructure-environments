resource "azurerm_container_group" "back_office_containers" {
  name                = "bo-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  network_profile_id  = azurerm_network_profile.back_office_clamav.id

  container {
    name   = "clamav"
    image  = "clamav/clamav:latest"
    cpu    = "1"
    memory = "3"

    volume {
      name       = "clamav-db"
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
