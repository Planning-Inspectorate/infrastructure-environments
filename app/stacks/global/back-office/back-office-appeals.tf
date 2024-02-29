module "applications_app_service_front_door" {
  source = "../../../modules/app-service-front-door"

  domain_name = var.domain_name
  # app_service_domain                = "primary_app_service"
  app_service_url                   = var.app_service_url
  common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  common_tags                       = local.tags
  environment                       = var.environment
  # enable_search_indexing_by_default = true
  # location     = var.location # Needed for RG
  service_name = var.service_name

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}

# resource "azurerm_cdn_frontdoor_firewall_policy" "applications" {
#   name                              = var.name
#   resource_group_name               = var.resource_group_name # TODO: Create resource group in this module and then pass it in, will ultimately be replaced by common one
#   sku_name                          = "Premium_AzureFrontDoor"
#   enabled                           = true
#   mode                              = var.front_door_waf_mode
#   custom_block_response_status_code = 429

#   tags = var.common_tags
# }

# resource "azurerm_cdn_frontdoor_security_policy" "applications" {
#   name                     = var.name
#   cdn_frontdoor_profile_id = module.applications_app_service_front_door.id

#   # TODO: Copy policy from existing FD
# }

# TODO: WAF
# TODO: Failover configuration
