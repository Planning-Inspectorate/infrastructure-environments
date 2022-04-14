resource "azurerm_frontdoor_firewall_policy" "default" {
  name                = replace("pinswaf${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name = azurerm_resource_group.frontdoor.name
  enabled             = true
  mode                = "Detection"

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }

  custom_rule {
    name                           = "RateLimiting"
    action                         = "Log"
    enabled                        = true
    priority                       = 1
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 100

    match_condition {
      match_variable = "RemoteAddr"
      match_values   = ["*"]
      operator       = "Any"
    }
  }

  tags = var.common_tags
}
