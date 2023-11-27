resource "azurerm_service_plan" "back_office_functions_plan" {
  name                = "pins-bo-functions-${var.resource_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type = "Linux"
  # This has to be Premium because we're taking advantage of the VNET integration
  sku_name = var.service_plan_sku

  tags = var.tags
}
