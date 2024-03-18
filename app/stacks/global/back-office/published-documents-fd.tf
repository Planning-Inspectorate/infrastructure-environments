module "published_documents_front_door" {
  source = "../../../modules/front-door"
  count  = var.environment == "dev" ? 1 : 0

  # app_service_domain                = "primary_app_service"
  host_name = "back-office-test-for-pr.com"
  # common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  common_tags = local.tags
  environment = "dev"
  # enable_search_indexing_by_default = var.enable_search_indexing_by_default
  location            = var.location # Needed for RG
  name                = "publisheddocumentsfd"
  resource_group_name = azurerm_resource_group.frontdoor.name
  service_name        = "back-office"
  sku_name            = "Standard_AzureFrontDoor"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
