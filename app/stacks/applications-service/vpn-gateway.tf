resource "azurerm_public_ip" "vpn_gateway" {
  name                = "pins-vgw-pip-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  allocation_method   = "Static"
  tags                = local.tags
}

resource "azurerm_virtual_network_gateway" "applications_service" {
  name                = "pins-vgw-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "VpnGw2"
  tags                = local.tags

  ip_configuration {
    name                          = "Public"
    public_ip_address_id          = azurerm_public_ip.vpn_gateway.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.vpn_gateway_subnet_id
  }
}

resource "azurerm_local_network_gateway" "national_infrastructure" {
  name                = "pins-lgw-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  gateway_address     = "51.104.42.155"
  address_space       = ["10.222.0.0/26"]
  tags                = local.tags
}

resource "azurerm_virtual_network_gateway_connection" "national_infrastructure" {
  name                       = "pins-vcn-${local.service_name}-${local.resource_suffix}"
  resource_group_name        = azurerm_resource_group.applications_service_stack.name
  location                   = azurerm_resource_group.applications_service_stack.location
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.applications_service.id
  local_network_gateway_id   = azurerm_local_network_gateway.national_infrastructure.id
  shared_key                 = "Test" # var.key_vault_secret_refs["applications-service-vpn-gateway-shared-key"]
  tags                       = local.tags
}
