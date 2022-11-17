resource "azurerm_resource_group" "clam_av_group" {
  name     = "clam-av-group"
  location = module.azure_region_uks.location
}

resource "azurerm_container_group" "clam_av" {
  name                = "clam-av"
  location            = azurerm_resource_group.clam_av_group.location
  resource_group_name = azurerm_resource_group.clam_av_group.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  network_profile_id  = "network_profile_id"

  container {
    name   = "hello-world"
    image  = "clamav/clamav"
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = 3310
      protocol = "TCP"
    }

    ports {
      port     = 7357
      protocol = "TCP"
    }

    volume {
      name       = "clam-av-volume"
      mount_path = "/var/lib/clamav"
    }
  }
}
