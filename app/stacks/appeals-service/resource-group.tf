resource "azurerm_resource_group" "appeals_service_stack" {
  name     = "${local.prefix}-appeals-service"
  location = module.azure_region_uks.location
  tags     = var.common_tags
}
