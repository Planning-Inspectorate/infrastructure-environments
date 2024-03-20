resource "azurerm_cdn_frontdoor_rule_set" "default" {
  name                     = "backofficeapplicationsdoc${var.environment}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
}
