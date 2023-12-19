module "front_door" {
  for_each = var.endpoints

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/azure-front-door?ref=1.10"

  cdn_frontdoor_origin_path         = var.cdn_frontdoor_origin_path
  common_tags                       = var.common_tags
  common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  custom_domain                     = var.custom_domain
  endpoints                         = var.endpoints
  name                              = var.name
  origins                           = var.origins
  origin_groups                     = var.origin_groups
  resource_group_name               = var.resource_group_name
  routes                            = var.routes
  service_name                      = var.service_name

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
