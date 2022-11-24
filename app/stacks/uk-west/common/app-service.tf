resource "azurerm_service_plan" "common_service_plan" {
  name                = "pins-asp-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name

  os_type  = "Linux"
  sku_name = var.app_service_plan_sku

  tags = local.tags
}
