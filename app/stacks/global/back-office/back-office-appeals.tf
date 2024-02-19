module "applications_app_service_front_door" {
  source = "../"

  domain_name                       = "back-office.com"
  app_service_domain                = "primary_app_service"
  environment                       = "dev"
  enable_search_indexing_by_default = true
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
