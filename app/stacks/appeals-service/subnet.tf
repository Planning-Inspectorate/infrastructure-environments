resource "azurerm_subnet" "appeals_service_ingress" {
  name                                           = "pins-snet-appeals-service-ingress-${local.resource_suffix}"
  resource_group_name                            = var.common_resource_group_name
  virtual_network_name                           = var.common_network_name
  address_prefixes                               = ["10.0.2.0/24"]
  enforce_private_link_endpoint_network_policies = true
}
