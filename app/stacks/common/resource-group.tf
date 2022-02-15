resource "azurerm_resource_group" "common_infrastructure" {
  name     = "pins-rg-common-${local.resource_suffix}"
  location = module.azure_region_uks.location
  tags     = var.common_tags
}
