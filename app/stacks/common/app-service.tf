resource "azurerm_app_service_plan" "common_service_plan" {
  name                = "pins-asp-common-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV2"
    size = "P1"
  }

  tags = local.tags
}
