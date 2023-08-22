resource "azurerm_frontdoor_firewall_policy" "default" {
  name                              = replace("pinswaf${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  enabled                           = true
  mode                              = var.front_door_waf_mode
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    override {
      rule_group_name = "RFI"

      rule {
        # Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link
        rule_id = "931130"
        action  = "Block"

        exclusion {
          # Exclusion to fix BOAS-153
          match_variable = "RequestBodyPostArgNames" # PostParamValue:applicant.website
          operator       = "Equals"
          selector       = "applicant.website"
        }
      }
    }

    override {
      rule_group_name = "LFI"

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930100"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930110"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }
    }

    override {
      rule_group_name = "SQLI"

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        rule_id = "942200"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        rule_id = "942260"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        rule_id = "942430"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        rule_id = "942440"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }
    }

    # exception for ASB-1692
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    override {
      rule_group_name = "XSS"

      rule {
        # Possible XSS Attack Detected - HTML Tag Handler
        rule_id = "941320"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }

      rule {
        # XSS Filter - Category 5: Disallowed HTML Attributes
        rule_id = "941150"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }
    }
  }

  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 300

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

resource "azurerm_cdn_frontdoor_firewall_policy" "default" {
  name                              = replace("pinscdnwaf${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  sku_name                          = azurerm_cdn_frontdoor_profile.common.sku_name
  enabled                           = true
  mode                              = var.front_door_waf_mode
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
    action  = "Block"

    override {
      rule_group_name = "RFI"

      rule {
        # Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link
        rule_id = "931130"
        action  = "Block"

        exclusion {
          # Exclusion to fix BOAS-153
          match_variable = "RequestBodyPostArgNames" # PostParamValue:applicant.website
          operator       = "Equals"
          selector       = "applicant.website"
        }
      }
    }

    override {
      rule_group_name = "LFI"

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930100"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930110"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }
    }

    override {
      rule_group_name = "SQLI"

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        rule_id = "942200"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        rule_id = "942260"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        rule_id = "942430"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        rule_id = "942440"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }
    }
  }

  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 300

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

resource "azurerm_cdn_frontdoor_security_policy" "common" {
  name                     = "default"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.default.id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.common.id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}

resource "azurerm_cdn_frontdoor_firewall_policy" "back_office_applications_service" {
  name                              = replace("boapplicationsservice${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  sku_name                          = azurerm_cdn_frontdoor_profile.back_office_applications_service.sku_name
  enabled                           = true
  mode                              = var.front_door_waf_mode
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
    action  = "Block"

    override {
      rule_group_name = "RFI"

      rule {
        # Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link
        rule_id = "931130"
        action  = "Block"

        exclusion {
          # Exclusion to fix BOAS-153
          match_variable = "RequestBodyPostArgNames" # PostParamValue:applicant.website
          operator       = "Equals"
          selector       = "applicant.website"
        }
      }
    }

    override {
      rule_group_name = "LFI"

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930100"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930110"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }
    }

    override {
      rule_group_name = "SQLI"

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        rule_id = "942200"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        rule_id = "942260"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        rule_id = "942430"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        rule_id = "942440"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }
    }

    # exception for ASB-1692
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    override {
      rule_group_name = "XSS"

      rule {
        # Possible XSS Attack Detected - HTML Tag Handler
        rule_id = "941320"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }

      rule {
        # XSS Filter - Category 5: Disallowed HTML Attributes
        rule_id = "941150"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }
    }
  }



  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 300

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

resource "azurerm_cdn_frontdoor_security_policy" "back_office_applications_service" {
  name                     = "back-office-applications-service"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.back_office_applications_service.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.back_office_applications_service.id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.back_office_applications_service.id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}


resource "azurerm_cdn_frontdoor_firewall_policy" "back_office_appeals_service" {
  name                              = replace("boappealsservice${local.service_name}${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  sku_name                          = azurerm_cdn_frontdoor_profile.back_office_appeals_service.sku_name
  enabled                           = true
  mode                              = var.front_door_waf_mode
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
    action  = "Block"

    override {
      rule_group_name = "RFI"

      rule {
        # Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link
        rule_id = "931130"
        action  = "Block"

        exclusion {
          # Exclusion to fix BOAS-153
          match_variable = "RequestBodyPostArgNames" # PostParamValue:applicant.website
          operator       = "Equals"
          selector       = "applicant.website"
        }
      }
    }

    override {
      rule_group_name = "LFI"

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930100"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        rule_id = "930110"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }
    }

    override {
      rule_group_name = "SQLI"

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        rule_id = "942200"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        rule_id = "942260"
        action  = "Block"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        rule_id = "942430"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        rule_id = "942440"
        action  = "Block"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }
    }

    # exception for ASB-1692
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    override {
      rule_group_name = "XSS"

      rule {
        # Possible XSS Attack Detected - HTML Tag Handler
        rule_id = "941320"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }

      rule {
        # XSS Filter - Category 5: Disallowed HTML Attributes
        rule_id = "941150"
        action  = "Block"

        exclusion {
          match_variable = "RequestBodyPostArgNames"
          operator       = "Equals"
          selector       = "backOfficeProjectUpdateContent"
        }
      }
    }
  }



  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 300

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

resource "azurerm_cdn_frontdoor_security_policy" "back_office_appeals_service" {
  name                     = "back-office-appeals-service"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.back_office_appeals_service.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.back_office_appeals_service.id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.back_office_appeals_service.id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}
