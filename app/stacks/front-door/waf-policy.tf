resource "azurerm_frontdoor_firewall_policy" "default" {
  name                = "pins-waf-${local.service_name}-${local.resource_suffix}"
  resource_group_name = var.common_resource_group_name
  enabled             = true
  mode                = "Prevention"
  tags                = var.common_tags

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }
}
