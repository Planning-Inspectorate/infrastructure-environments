resource "azurerm_service_plan" "clamav_service_plan" {
  name                = "pins-asp-doc-check-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = var.service_plan_sku

  tags = var.tags
}
