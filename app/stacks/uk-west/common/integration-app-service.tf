resource "azurerm_service_plan" "common_integration_functions_service_plan" {
  #checkov:skip=CKV_AZURE_212: TODO: Ensure App Service has a minimum number of instances for failover
  #checkov:skip=CKV_AZURE_225: TODO: Ensure the App Service Plan is zone redundant
  name                = "pins-asp-integration-functions-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.common_infrastructure.location
  resource_group_name = azurerm_resource_group.common_infrastructure.name

  os_type  = "Linux"
  sku_name = var.integration_functions_app_service_plan_sku

  tags = merge(
    local.tags,
    {
      Feature = "IntegrationFunctions"
    }
  )
}
