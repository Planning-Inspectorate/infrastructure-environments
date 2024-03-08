resource "azurerm_service_plan" "common_service_plan" {
  #checkov:skip=CKV_AZURE_212: TODO: Ensure App Service has a minimum number of instances for failover
  #checkov:skip=CKV_AZURE_225: TODO: Ensure the App Service Plan is zone redundant
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asp-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name

  os_type  = "Linux"
  sku_name = var.app_service_plan_sku

  tags = local.tags
}
