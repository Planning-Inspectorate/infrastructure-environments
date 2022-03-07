resource "azurerm_public_ip" "vnet_gateway" {
  name                = "pins-vgw-pip-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  location            = azurerm_resource_group.common_infrastructure.location
  allocation_method   = "Dynamic"
  tags                = local.tags
}

resource "azurerm_virtual_network_gateway" "common" {
  name                = "pins-vgw-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  location            = azurerm_resource_group.common_infrastructure.location
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "VpnGw2"
  tags                = local.tags

  ip_configuration {
    name                          = "Public"
    public_ip_address_id          = azurerm_public_ip.vnet_gateway.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vnet_gateway_subnet.id
  }
}
