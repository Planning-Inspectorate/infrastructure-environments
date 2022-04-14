resource "azurerm_frontdoor_firewall_policy" "default" {
  name                              = replace("pinswaf${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  enabled                           = true
  mode                              = "Detection"
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    override {
      rule_group_name = "SQLI"

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        rule_id = "942200"
        enabled = false
        action  = "Block"
      }
    }
  }

  managed_rule {
    type    = "OWASP"
    version = "3.0"
  }

  custom_rule {
    name                           = "RateLimitRequestMethod"
    action                         = "Log"
    enabled                        = true
    priority                       = 101
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 5

    match_condition {
      match_variable = "RequestMethod"
      operator       = "Equal"
      match_values = [
        "GET",
        "POST",
        "PUT",
        "DELETE",
        "COPY",
        "MOVE",
        "HEAD",
        "OPTIONS"
      ]
    }
  }

  tags = var.common_tags
}
