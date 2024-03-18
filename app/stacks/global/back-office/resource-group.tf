# TODO: Create a shared FD resource group in the global stack
resource "azurerm_resource_group" "frontdoor" {
  name     = "pins-rg-${var.resource_group_name}-front-door-${var.environment}-${module.azure_region_uks.location_short}"
  location = module.azure_region_uks.location

  tags = merge(
    local.tags,
    {
      Region = module.azure_region_uks.location
    }
  )
}
