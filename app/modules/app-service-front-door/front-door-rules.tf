resource "azurerm_cdn_frontdoor_rule_set" "default" {
  count = var.environment == "dev" ? 1 : 0

  name                     = var.name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
}
