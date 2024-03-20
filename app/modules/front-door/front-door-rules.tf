resource "azurerm_cdn_frontdoor_rule_set" "default" {
  name                     = "${local.service_name}-${local.environment}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
}
