resource "azurerm_app_service_plan" "common_service_plan" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asp-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }

  tags = local.tags
}
