resource "azurerm_subnet" "applicatons_service_ingress" {
  name                                           = "pins-snet-applications-service-ingress-${local.resource_suffix}"
  resource_group_name                            = var.common_resource_group_name
  virtual_network_name                           = var.common_network_name
  address_prefixes                               = ["10.0.3.0/24"]
  enforce_private_link_endpoint_network_policies = true
}
