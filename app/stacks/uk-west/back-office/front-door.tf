module "front_door" {
  source = "../../../components/back-office-app-services/front-door"

  cdn_frontdoor_origin_path         = var.cdn_frontdoor_origin_path
  common_tags                       = var.common_tags
  common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  custom_domain                     = var.custom_domain
  endpoints                         = var.endpoints
  host_name                         = var.host_name
  name                              = var.name
  origins                           = var.origins
  origin_groups                     = var.origin_groups
  resource_group_name               = var.resource_group_name
  routes                            = var.routes
  service_name                      = var.service_name
  tooling_subscription_id           = var.tooling_subscription_id
}
