data "azurerm_resource_group" "frontdoor" {
  name = "pins-rg-front-door-${var.environment}-${module.azure_region_uks.location_short}"
}
