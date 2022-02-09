resource "azurerm_resource_group" "base_infrastructure" {
  name     = "pins-${var.region}-odt-base-infrastructure"
  location = module.azure_region_uks.location
  tags     = var.common_tags
}
