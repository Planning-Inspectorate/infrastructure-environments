module "applications_app_service_front_door" {
  source = "../../../modules/front-door"
  count  = var.environment == "dev" ? 1 : 0

  domain_name = var.domain_name
  # app_service_domain                = "primary_app_service"
  app_service_url                   = var.app_service_url
  common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  common_tags                       = local.tags
  environment                       = var.environment
  # enable_search_indexing_by_default = var.enable_search_indexing_by_default
  location            = var.location # Needed for RG
  name                = var.name
  resource_group_name = var.resource_group_name
  service_name        = var.service_name
  sku_name            = "Standard_AzureFrontDoor"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
