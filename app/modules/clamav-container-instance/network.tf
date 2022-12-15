resource "azurerm_subnet" "back_office_clamav" {
  name                 = "pins-snet-${var.service_name}-clam-av-${var.resource_suffix}"
  resource_group_name  = var.common_resource_group_name
  virtual_network_name = var.common_vnet_name
  address_prefixes     = [var.common_vnet_cidr_blocks["back_office_clamav"]]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_network_profile" "back_office_clamav" {
  name                = "pins-snet-bac-office-clam-av-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.common_resource_group_name

  container_network_interface {
    name = "containers-subnet-np-nic"

    ip_configuration {
      name      = "containers-subnet-np-ip"
      subnet_id = azurerm_subnet.back_office_clamav.id
    }
  }
}
