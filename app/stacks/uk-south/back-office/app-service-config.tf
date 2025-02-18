resource "azurerm_app_configuration" "back_office" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asc-back-office-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = module.azure_region_uks.location
  sku                 = "standard"

  tags = local.tags
}

resource "azurerm_private_endpoint" "back_office_app_config" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-pe-${local.service_name}-asc-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.app_config.id]
  }

  private_service_connection {
    name                           = "pins-pe-${local.service_name}-asc-${local.resource_suffix}"
    private_connection_resource_id = azurerm_app_configuration.back_office[0].id
    subresource_names              = ["configurationStores"]
    is_manual_connection           = false
  }

  tags = local.tags
}
