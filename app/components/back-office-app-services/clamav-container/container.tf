resource "azurerm_container_group" "back_office_containers" {
  name                = "bo-clamav-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  network_profile_id  = azurerm_network_profile.back_office_clamav.id

  identity {
    type = "SystemAssigned"
  }

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

  container {
    name   = "azurecli"
    image  = "mcr.microsoft.com/azure-cli:latest"
    cpu    = "0.5"
    memory = "1.5"

    commands = ["/bin/bash", "-c", "az network private-dns record-set a update --name clamav -g pins-rg-back-office-dev-ukw-001 -z backoffice.dev --set aRecords[0].ipv4Address=10.1.7.4"]
  }

  tags = var.tags
}
