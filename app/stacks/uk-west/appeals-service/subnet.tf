resource "azurerm_subnet" "appeals_service_ingress" {
  name                              = "pins-snet-appeals-service-ingress-${local.resource_suffix}"
  resource_group_name               = var.common_resource_group_name
  virtual_network_name              = var.common_vnet_name
  address_prefixes                  = [var.common_vnet_cidr_blocks["appeals_service_endpoints"]]
  private_endpoint_network_policies = "Enabled"
}

## peer to appeals back office test environment for Service Bus connection
resource "azurerm_virtual_network_peering" "appeals_service_to_back_office" {
  count                     = var.environment == "staging" ? 1 : 0
  name                      = "pins-peer-appeals-service-${var.environment}-to-abo-test"
  remote_virtual_network_id = data.azurerm_virtual_network.appeals_bo[0].id #TEST environment
  resource_group_name       = var.appeals_vnet_staging.fo_rg
  virtual_network_name      = var.appeals_vnet_staging.fo_network_name
}

resource "azurerm_virtual_network_peering" "back_office_to_appeals_service" {
  count                     = var.environment == "staging" ? 1 : 0
  name                      = "pins-peer-abo-test-to-appeals-service-${var.environment}"
  remote_virtual_network_id = data.azurerm_virtual_network.staging_afo_vnet[0].id
  resource_group_name       = var.appeals_vnet_staging.bo_rg
  virtual_network_name      = var.appeals_vnet_staging.bo_network_name
}
