resource "azurerm_resource_group" "common_infrastructure" {
  name     = "pins-rg-${local.service_name}-${local.resource_suffix}"
  location = module.azure_region_ukw.location

  tags = local.tags
}
