resource "azurerm_cdn_frontdoor_firewall_policy" "default" {
  count = var.sku_name == "Premium_AzureFrontDoor" ? 1 : 0

  name                              = replace("back-office-appeals${var.environment}", "-", "")
  resource_group_name               = data.azurerm_resource_group.frontdoor.name
  sku_name                          = var.sku_name
  enabled                           = true
  mode                              = "Prevention"
  custom_block_response_status_code = 429

  tags = var.common_tags
}

resource "azurerm_cdn_frontdoor_security_policy" "default" {
  count = var.sku_name == "Premium_AzureFrontDoor" ? 1 : 0

  name                     = replace("back-office-appeals-${var.environment}", "-", "")
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.default[0].id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.default.id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}
