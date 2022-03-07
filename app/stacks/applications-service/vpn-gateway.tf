resource "azurerm_local_network_gateway" "national_infrastructure" {
  name                = "pins-lgw-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  gateway_address     = var.national_infrastructure_gateway_ip
  address_space       = var.national_infrastructure_vnet_address_space
  tags                = local.tags
}

resource "azurerm_virtual_network_gateway_connection" "national_infrastructure" {
  name                       = "pins-vcn-${local.service_name}-${local.resource_suffix}"
  resource_group_name        = azurerm_resource_group.applications_service_stack.name
  location                   = azurerm_resource_group.applications_service_stack.location
  type                       = "IPsec"
  virtual_network_gateway_id = var.common_vnet_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.national_infrastructure.id
  shared_key                 = var.applications_service_vpn_gateway_shared_key
  tags                       = local.tags
}
