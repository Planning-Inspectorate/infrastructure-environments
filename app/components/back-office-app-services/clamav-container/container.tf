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

    commands = ["/bin/sh", "-c", "az login --identity; az network private-dns record-set a update --resource-group ${var.resource_group_name} --zone-name ${local.domain_name} --name ${local.dns_record_name} --set \"aRecords[0].ipv4Address=$(hostname -i)\"; sleep 100000"]
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
