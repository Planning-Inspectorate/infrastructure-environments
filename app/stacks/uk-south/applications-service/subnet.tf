resource "azurerm_subnet" "applications_service_ingress" {
  name                                      = "pins-snet-${local.service_name}-ingress-${local.resource_suffix}"
  resource_group_name                       = var.common_resource_group_name
  virtual_network_name                      = var.common_vnet_name
  address_prefixes                          = [var.common_vnet_cidr_blocks["applications_service_endpoints"]]
  private_endpoint_network_policies_enabled = true
}
