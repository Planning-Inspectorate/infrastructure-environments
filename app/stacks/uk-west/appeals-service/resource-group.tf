resource "azurerm_resource_group" "appeals_service_stack" {
  count = var.is_dr_deployment ? 1 : 0

  name     = "pins-rg-${local.service_name}-${local.resource_suffix}"
  location = module.azure_region_ukw.location

  tags = local.tags
}
