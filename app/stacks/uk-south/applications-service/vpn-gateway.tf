resource "azurerm_local_network_gateway" "national_infrastructure" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-lgw-${local.service_name}-${local.resource_suffix}"
  resource_group_name = var.common_resource_group_name
  location            = azurerm_resource_group.applications_service_stack.location
  gateway_address     = var.national_infrastructure_gateway_ip
  address_space       = var.national_infrastructure_vnet_address_space
  tags                = local.tags
}

resource "azurerm_virtual_network_gateway_connection" "national_infrastructure" {
  count = var.is_dr_deployment ? 1 : 0

  name                       = "pins-vcn-${local.service_name}-${local.resource_suffix}"
  resource_group_name        = var.common_resource_group_name
  location                   = azurerm_resource_group.applications_service_stack.location
  type                       = "IPsec"
  virtual_network_gateway_id = var.common_vnet_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.national_infrastructure[count.index].id
  shared_key                 = var.applications_service_vpn_gateway_shared_key
  tags                       = local.tags
}
