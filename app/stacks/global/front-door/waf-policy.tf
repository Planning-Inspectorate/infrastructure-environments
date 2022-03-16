resource "azurerm_frontdoor_firewall_policy" "default" {
  name                = replace("pinswaf${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name = azurerm_resource_group.frontdoor.name
  enabled             = true
  mode                = "Prevention"
  tags                = var.common_tags

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }
}
