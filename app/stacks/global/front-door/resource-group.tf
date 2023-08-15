resource "azurerm_resource_group" "frontdoor" {
  name     = "pins-rg-${local.service_name}-front-door-${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  location = module.azure_region_uks.location

  tags = merge(
    local.tags,
    {
      Region = module.azure_region_uks.location
    }
  )
}

resource "azurerm_resource_group" "frontdoor_premium" {
  name     = "pins-rg-${local.service_name}-front-door-premium-${var.environment}-${var.instance}"
  location = "Global"

  tags = merge(
    local.tags,
  )
}
