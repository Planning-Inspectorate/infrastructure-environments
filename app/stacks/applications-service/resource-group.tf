resource "azurerm_resource_group" "applications_service_stack" {
  name     = "pins-rg-${local.service_name}-${local.resource_suffix}"
  location = module.azure_region_uks.location
  tags     = var.common_tags
}
