resource "azurerm_service_plan" "common_service_plan" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asp-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name

  os_type  = "Linux"
  sku_name = "P1v2"

  tags = local.tags
}
