resource "azurerm_resource_group" "appeals_service_stack" {
  name     = "pins-rg-appeals-service-${local.resource_suffix}"
  location = module.azure_region_uks.location
  tags     = var.common_tags
}
