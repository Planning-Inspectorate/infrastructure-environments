resource "azurerm_public_ip" "vnet_gateway" {
  count = var.deploy_national_infrastructure_vnet_gateway ? 1 : 0

  name                = "pins-vgw-pip-${var.service_name}-${var.resource_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "common" {
  count = var.deploy_national_infrastructure_vnet_gateway ? 1 : 0

  name                = "pins-vgw-${var.service_name}-${var.resource_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "VpnGw2"

  ip_configuration {
    name                          = "Public"
    public_ip_address_id          = azurerm_public_ip.vnet_gateway[count.index].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vnet_gateway_subnet.id
  }

  tags = var.tags
}
