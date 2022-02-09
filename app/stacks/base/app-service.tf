resource "azurerm_app_service_plan" "base_service_plan" {
  name                = "pins-${module.azure_region_uks.location_short}-odt-app-service-plan"
  location            = azurerm_resource_group.base_infrastructure.location
  resource_group_name = azurerm_resource_group.base_infrastructure.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
  tags = var.common_tags
}
