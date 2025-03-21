resource "azurerm_service_plan" "apps" {
  #checkov:skip=CKV_AZURE_212: TODO: Ensure App Service has a minimum number of instances for failover
  #checkov:skip=CKV_AZURE_225: TODO: Ensure the App Service Plan is zone redundant
  name = "pins-asp-${local.service_name}-${local.resource_suffix}"
  # needs to be in the same resource group as the previous plan so that apps can be moved
  resource_group_name = var.common_resource_group_name
  location            = azurerm_resource_group.applications_service_stack.location

  os_type                  = "Linux"
  sku_name                 = var.apps_config.app_service_plan.sku
  per_site_scaling_enabled = var.apps_config.app_service_plan.per_site_scaling_enabled
  worker_count             = var.apps_config.app_service_plan.worker_count
  zone_balancing_enabled   = var.apps_config.app_service_plan.zone_balancing_enabled

  tags = local.tags
}
