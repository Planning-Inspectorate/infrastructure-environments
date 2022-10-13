resource "azurerm_app_configuration" "appeals_service" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asc-appeals-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  location            = module.azure_region_uks.location
  sku                 = "standard"

  tags = local.tags
}
