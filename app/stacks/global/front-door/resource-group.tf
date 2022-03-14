resource "azurerm_resource_group" "frontdoor" {
  name     = "pins-rg-${local.service_name}-front-door-${local.resource_suffix}"
  location = module.azure_region_uks.location

  tags = local.tags
}
