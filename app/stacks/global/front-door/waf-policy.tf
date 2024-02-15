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
        action  = "Block"
        enabled = true
        rule_id = "931130"

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
        action  = "Block"
        enabled = true
        rule_id = "930100"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        action  = "Block"
        enabled = true
        rule_id = "930110"

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
        action  = "Block"
        enabled = true
        rule_id = "942200"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        action  = "Block"
        enabled = true
        rule_id = "942260"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        action  = "Block"
        enabled = true
        rule_id = "942430"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        action  = "Block"
        enabled = true
        rule_id = "942440"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Hex Encoding Identified
        action  = "Block"
        enabled = true
        rule_id = "942450"

        exclusion {
          # Exclusion to allow cookie connect.sid
          match_variable = "RequestCookieNames" # "CookieValue:connect.sid"
          operator       = "Equals"
          selector       = "connect.sid"
        }
      }
    }

    # Exception for ASB-2059 - Exclude all rules for this selector.
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "comment"
    }

    # Exception for ASB-1692 merged with ASB-1928 - Exclude all rules for this selector.
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "backOfficeProjectUpdateContent"
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

resource "azurerm_frontdoor_firewall_policy" "appeals_frontend" {
  name                              = replace("pinswafappealsfrontend${local.resource_suffix}", "-", "")
  resource_group_name               = azurerm_resource_group.frontdoor.name
  enabled                           = true
  mode                              = var.front_door_waf_mode
  redirect_url                      = "https://${var.appeals_service_public_url}${var.front_door_waf_appeals_redirect_path}"
  custom_block_response_status_code = 429

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    override {
      rule_group_name = "RFI"

      rule {
        # Possible Remote File Inclusion (RFI) Attack: Off-Domain Reference/Link
        action  = "Block"
        enabled = true
        rule_id = "931130"

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
        action  = "Block"
        enabled = true
        rule_id = "930100"

        exclusion {
          # Exclusion to allow acceptance of cookies
          match_variable = "RequestCookieNames" # "CookieValue:cookie_policy"
          operator       = "Equals"
          selector       = "cookie_policy"
        }
      }

      rule {
        # Path Traversal Attack (/../)
        action  = "Block"
        enabled = true
        rule_id = "930110"

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
        # Common SQL injection testing
        action  = "Redirect"
        enabled = true
        rule_id = "942110"
      }

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        action  = "Block"
        enabled = true
        rule_id = "942200"

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
        # Suspisious use of SQL keywords
        action  = "Redirect"
        enabled = true
        rule_id = "942400"
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        action  = "Block"
        enabled = true
        rule_id = "942430"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Comment Sequence Detected
        action  = "Block"
        enabled = true
        rule_id = "942440"

        exclusion {
          # Exclusion to allow Azure AD authentication redirection
          match_variable = "QueryStringArgNames" # "QueryParamValue:code"
          operator       = "Equals"
          selector       = "code"
        }
      }

      rule {
        # SQL Hex Encoding Identified
        action  = "Block"
        enabled = true
        rule_id = "942450"

        exclusion {
          # Exclusion to allow cookie connect.sid
          match_variable = "RequestCookieNames" # "CookieValue:connect.sid"
          operator       = "Equals"
          selector       = "connect.sid"
        }
      }
    }

    # Exception for ASB-2059 - Exclude all rules for this selector.
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "comment"
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
