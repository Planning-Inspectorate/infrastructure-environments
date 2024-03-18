# TODO: Create a shared FD resource group in the global stack
resource "azurerm_resource_group" "frontdoor" {
  name     = "${var.environment}"
  location = module.azure_region_uks.location

  tags = merge(
    local.tags,
  feature/BOAS-113-add-group-IDs-to-the-deployment-containers  {
      Region = module.azure_region_uks.location
    }
  )
}
