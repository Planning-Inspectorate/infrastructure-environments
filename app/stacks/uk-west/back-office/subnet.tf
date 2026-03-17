resource "azurerm_subnet" "back_office_ingress" {
  name                              = "pins-snet-${local.service_name}-ingress-${local.resource_suffix}"
  resource_group_name               = var.common_resource_group_name
  virtual_network_name              = var.common_vnet_name
  address_prefixes                  = [var.common_vnet_cidr_blocks["back_office_endpoints"]]
  private_endpoint_network_policies = "Enabled"
}

## vnet peering between back office and redaction
resource "azurerm_virtual_network_peering" "back_office_to_redaction" {
  count = var.enabled_redaction_system ? 1 : 0

  name                      = "${local.org}-peer-${local.service_name}-to-redaction-${var.environment}"
  resource_group_name       = var.common_resource_group_name
  virtual_network_name      = var.common_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.redaction_vnet[0].id
}

resource "azurerm_virtual_network_peering" "redaction_to_back_office" {

  count = var.enabled_redaction_system ? 1 : 0

  name                      = "${local.org}-peer-tooling-to-${local.service_name}-${var.environment}"
  resource_group_name       = var.redaction_system_integration.network_rg
  virtual_network_name      = var.redaction_system_integration.network_name
  remote_virtual_network_id = data.azurerm_virtual_network.common_vnet.id
}
