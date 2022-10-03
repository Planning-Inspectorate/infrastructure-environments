resource "azurerm_app_configuration" "appeals_service" {
  name                = "pins-asc-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  location            = module.azure_region_primary.location
}
