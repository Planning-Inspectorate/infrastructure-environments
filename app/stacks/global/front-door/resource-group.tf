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
