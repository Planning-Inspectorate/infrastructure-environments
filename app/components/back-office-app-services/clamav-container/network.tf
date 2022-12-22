resource "azurerm_network_profile" "back_office_clamav" {
  name                = "pins-snet-bac-office-clam-av-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.common_resource_group_name

  container_network_interface {
    name = "containers-subnet-np-nic"

    ip_configuration {
      name      = "containers-subnet-np-ip"
      subnet_id = var.back_office_clamav_subnet_id
    }
  }
}
