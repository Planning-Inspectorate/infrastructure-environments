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
        action  = "Log"
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
        action  = "Log"
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
        # SQL Injection Attack Detected via libinjection
        action  = "Log"
        enabled = true
        rule_id = "942100"
      }

      rule {
        # SQL Injection Attack: Common Injection Testing Detected
        action  = "Log"
        enabled = true
        rule_id = "942110"
      }

      rule {
        # SQL Injection Attack: SQL Operator Detected
        action  = "Log"
        enabled = true
        rule_id = "942120"
      }

      rule {
        # SQL Injection Attack: Common DB Names Detected
        action  = "Log"
        enabled = true
        rule_id = "942140"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942150"
      }

      rule {
        # Detects blind sqli tests using sleep() or benchmark()
        action  = "Log"
        enabled = true
        rule_id = "942160"
      }

      rule {
        # Detects SQL benchmark and sleep injection attempts including conditional queries
        action  = "Log"
        enabled = true
        rule_id = "942170"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 1/3
        action  = "Log"
        enabled = true
        rule_id = "942180"
      }

      rule {
        # Detects MSSQL code execution and information gathering attempts
        action  = "Log"
        enabled = true
        rule_id = "942190"
      }

      rule {
        # Detects chained SQL injection attempts 1/2
        action  = "Log"
        enabled = true
        rule_id = "942210"
      }

      rule {
        # Looking for integer overflow attacks, these are taken from skipfish, except 3.0.00738585072007e-308 is the "magic number" crash
        action  = "Log"
        enabled = true
        rule_id = "942220"
      }

      rule {
        # Detects conditional SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942230"
      }

      rule {
        # Detects MySQL charset switch and MSSQL DoS attempts
        action  = "Log"
        enabled = true
        rule_id = "942240"
      }

      rule {
        # Detects MATCH AGAINST, MERGE and EXECUTE IMMEDIATE injections
        action  = "Log"
        enabled = true
        rule_id = "942250"
      }

      rule {
        # Looking for basic sql injection. Common attack string for mysql, oracle, and others.
        action  = "Log"
        enabled = true
        rule_id = "942270"
      }

      rule {
        # Detects Postgres pg_sleep injection, waitfor delay attacks and database shutdown attempts
        action  = "Log"
        enabled = true
        rule_id = "942280"
      }

      rule {
        # Finds basic MongoDB SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942290"
      }

      rule {
        # Detects MySQL comments, conditions, and ch(a)r injections
        action  = "Log"
        enabled = true
        rule_id = "942300"
      }

      rule {
        # Detects chained SQL injection attempts 2/2
        action  = "Log"
        enabled = true
        rule_id = "942310"
      }

      rule {
        # Detects MySQL and PostgreSQL stored procedure/function injections
        action  = "Log"
        enabled = true
        rule_id = "942320"
      }

      rule {
        # Detects classic SQL injection probings 1/2
        action  = "Log"
        enabled = true
        rule_id = "942330"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 3/3
        action  = "Log"
        enabled = true
        rule_id = "942340"
      }

      rule {
        # Detects MySQL UDF injection and other data/structure manipulation attempts
        action  = "Log"
        enabled = true
        rule_id = "942350"
      }

      rule {
        # Detects concatenated basic SQL injection and SQLLFI attempts
        action  = "Log"
        enabled = true
        rule_id = "942360"
      }

      rule {
        # Detects basic SQL injection based on keyword alter or union
        action  = "Log"
        enabled = true
        rule_id = "942361"
      }

      rule {
        # Detects classic SQL injection probings 2/3
        action  = "Log"
        enabled = true
        rule_id = "942370"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942380"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942390"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942410"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942470"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942480"
      }

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        action  = "Log"
        enabled = true
        rule_id = "942200"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        action  = "Log"
        enabled = true
        rule_id = "942260"
      }

      rule {
        # Suspicious use of SQL keywords
        action  = "Log"
        enabled = true
        rule_id = "942400"
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        action  = "Log"
        enabled = true
        rule_id = "942430"
      }

      rule {
        # SQL Comment Sequence Detected
        action  = "Log"
        enabled = true
        rule_id = "942440"
      }

      rule {
        # SQL Hex Encoding Identified
        action  = "Log"
        enabled = true
        rule_id = "942450"
      }
    }

	override {
      rule_group_name = "RCE"

      rule {
        # Remote Command Execution: Direct Unix Command Execution
        action  = "Log"
        enabled = true
        rule_id = "932150"
      }
    }

	override {
      rule_group_name = "PHP"

      rule {
        # PHP Injection Attack: PHP Open Tag Found
        action  = "Log"
        enabled = true
        rule_id = "933100"
      }
      rule {
        # PHP Injection Attack: PHP Script File Upload Found
        action  = "Log"
        enabled = true
        rule_id = "933110"
      }
      rule {
        # PHP Injection Attack: Configuration Directive Found
        action  = "Log"
        enabled = true
        rule_id = "933120"
      }
      rule {
        # PHP Injection Attack: Variables Found
        action  = "Log"
        enabled = true
        rule_id = "933130"
      }
      rule {
        # PHP Injection Attack: I/O Stream Found
        action  = "Log"
        enabled = true
        rule_id = "933140"
      }
      rule {
        # PHP Injection Attack: High-Risk PHP Function Name Found
        action  = "Log"
        enabled = true
        rule_id = "933150"
      }
      rule {
        # PHP Injection Attack: Medium-Risk PHP Function Name Found
        action  = "Log"
        enabled = true
        rule_id = "933151"
      }
      rule {
        # PHP Injection Attack: High-Risk PHP Function Call Found
        action  = "Log"
        enabled = true
        rule_id = "933160"
      }
      rule {
        # PHP Injection Attack: Serialized Object Injection
        action  = "Log"
        enabled = true
        rule_id = "933170"
      }
      rule {
        # PHP Injection Attack: Variable Function Call Found
        action  = "Log"
        enabled = true
        rule_id = "933180"
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

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }

  # custom rules in priority order to match the API
  custom_rule {
    name     = "IpBlock"
    action   = "Block"
    enabled  = true
    priority = 10
    type     = "MatchRule"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values = [
        "10.255.255.255" # placeholder value
      ]
    }
  }

  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 5
    rate_limit_threshold           = 1500

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

  custom_rule {
    name                           = "RateLimitNonUKTraffic"
    action                         = "Block"
    enabled                        = true
    priority                       = 200
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 5
    rate_limit_threshold           = 100

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "GeoMatch"
      match_values       = ["GB"]
      negation_condition = true
    }
  }

  tags = var.common_tags

  lifecycle {
    ignore_changes = [
      # match the first custom rule (IpBlock) and ignore the match values (IPs)
      # managed in Portal
      custom_rule[0].match_condition[0].match_values
    ]
  }
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
        action  = "Log"
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
        action  = "Log"
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
        action  = "Log"
        enabled = true
        rule_id = "942110"
      }

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        action  = "Log"
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
        action  = "Log"
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
        # Suspicious use of SQL keywords
        action  = "Log"
        enabled = true
        rule_id = "942400"
      }

      rule {
        # SQL Comment Sequence Detected
        action  = "Log"
        enabled = true
        rule_id = "942440"
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        action  = "Log"
        enabled = true
        rule_id = "942430"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942150"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942410"
      }

      rule {
        # SQL Injection Attack Detected via libinjection
        action  = "Log"
        enabled = true
        rule_id = "942100"
      }

      rule {
        # SQL Hex Encoding Identified
        action  = "Log"
        enabled = true
        rule_id = "942450"

        exclusion {
          # Exclusion to allow cookie connect.sid
          match_variable = "RequestCookieNames" # "CookieValue:connect.sid"
          operator       = "Equals"
          selector       = "connect.sid"
        }
      }

      rule {
        # SQL Injection Attack: SQL Operator Detected
        action  = "Log"
        enabled = true
        rule_id = "942120"
      }

      rule {
        # SQL Injection Attack: Common DB Names Detected
        action  = "Log"
        enabled = true
        rule_id = "942140"
      }

      rule {
        # Detects blind sqli tests using sleep() or benchmark()
        action  = "Log"
        enabled = true
        rule_id = "942160"
      }

      rule {
        # Detects SQL benchmark and sleep injection attempts including conditional queries
        action  = "Log"
        enabled = true
        rule_id = "942170"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 1/3
        action  = "Log"
        enabled = true
        rule_id = "942180"
      }

      rule {
        # Detects MSSQL code execution and information gathering attempts
        action  = "Log"
        enabled = true
        rule_id = "942190"
      }

      rule {
        # Detects chained SQL injection attempts 1/2
        action  = "Log"
        enabled = true
        rule_id = "942210"
      }

      rule {
        # Looking for integer overflow attacks, these are taken from skipfish, except 3.0.00738585072007e-308 is the "magic number" crash
        action  = "Log"
        enabled = true
        rule_id = "942220"
      }

      rule {
        # Detects conditional SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942230"
      }

      rule {
        # Detects MySQL charset switch and MSSQL DoS attempts
        action  = "Log"
        enabled = true
        rule_id = "942240"
      }

      rule {
        # Detects MATCH AGAINST, MERGE and EXECUTE IMMEDIATE injections
        action  = "Log"
        enabled = true
        rule_id = "942250"
      }

      rule {
        # Looking for basic sql injection. Common attack string for mysql, oracle, and others.
        action  = "Log"
        enabled = true
        rule_id = "942270"
      }

      rule {
        # Detects Postgres pg_sleep injection, waitfor delay attacks and database shutdown attempts
        action  = "Log"
        enabled = true
        rule_id = "942280"
      }

      rule {
        # Finds basic MongoDB SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942290"
      }

      rule {
        # Detects MySQL comments, conditions, and ch(a)r injections
        action  = "Log"
        enabled = true
        rule_id = "942300"
      }

      rule {
        # Detects chained SQL injection attempts 2/2
        action  = "Log"
        enabled = true
        rule_id = "942310"
      }

      rule {
        # Detects MySQL and PostgreSQL stored procedure/function injections
        action  = "Log"
        enabled = true
        rule_id = "942320"
      }

      rule {
        # Detects classic SQL injection probings 1/2
        action  = "Log"
        enabled = true
        rule_id = "942330"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 3/3
        action  = "Log"
        enabled = true
        rule_id = "942340"
      }

      rule {
        # Detects MySQL UDF injection and other data/structure manipulation attempts
        action  = "Log"
        enabled = true
        rule_id = "942350"
      }

      rule {
        # Detects concatenated basic SQL injection and SQLLFI attempts
        action  = "Log"
        enabled = true
        rule_id = "942360"
      }

      rule {
        # Detects basic SQL injection based on keyword alter or union
        action  = "Log"
        enabled = true
        rule_id = "942361"
      }

      rule {
        # Detects classic SQL injection probings 2/3
        action  = "Log"
        enabled = true
        rule_id = "942370"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942380"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942390"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942470"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942480"
      }
    }

    override {
      rule_group_name = "RCE"

      rule {
        # Remote Command Execution: Direct Unix Command Execution
        action  = "Log"
        enabled = true
        rule_id = "932150"
      }
    }

    override {
      rule_group_name = "XSS"

      rule {
        # XSS Filter - Category 2: Event Handler Vector	Log
        action  = "Log"
        enabled = true
        rule_id = "941120"
      }
    }

    # Exception for ASB-2059 - Exclude all rules for this selector.
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "comment"
    }

    # cross site request forgery token
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "_csrf"
    }

    # session cookie
    exclusion {
      match_variable = "RequestCookieNames"
      operator       = "Equals"
      selector       = "connect.sid"
    }
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }

  # custom rules in priority order to match the API
  custom_rule {
    name     = "IpBlock"
    action   = "Block"
    enabled  = true
    priority = 10
    type     = "MatchRule"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values = [
        "10.255.255.255" # placeholder value
      ]
    }
  }

  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 5
    rate_limit_threshold           = 1500

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

  lifecycle {
    ignore_changes = [
      # match the first custom rule (IpBlock) and ignore the match values (IPs)
      # managed in Portal
      custom_rule[0].match_condition[0].match_values
    ]
  }
}

resource "azurerm_frontdoor_firewall_policy" "back_office_applications_frontend" {
  name                              = replace("pinswafboapplicationsfrontend${local.resource_suffix}", "-", "")
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
        # SQL Injection Attack Detected via libinjection
        action  = "Log"
        enabled = true
        rule_id = "942100"
      }

      rule {
        # SQL Injection Attack: Common Injection Testing Detected
        action  = "Log"
        enabled = true
        rule_id = "942110"
      }

      rule {
        # SQL Injection Attack: SQL Operator Detected
        action  = "Log"
        enabled = true
        rule_id = "942120"
      }

      rule {
        # SQL Injection Attack: Common DB Names Detected
        action  = "Log"
        enabled = true
        rule_id = "942140"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942150"
      }

      rule {
        # Detects blind sqli tests using sleep() or benchmark()
        action  = "Log"
        enabled = true
        rule_id = "942160"
      }

      rule {
        # Detects SQL benchmark and sleep injection attempts including conditional queries
        action  = "Log"
        enabled = true
        rule_id = "942170"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 1/3
        action  = "Log"
        enabled = true
        rule_id = "942180"
      }

      rule {
        # Detects MSSQL code execution and information gathering attempts
        action  = "Log"
        enabled = true
        rule_id = "942190"
      }

      rule {
        # Detects chained SQL injection attempts 1/2
        action  = "Log"
        enabled = true
        rule_id = "942210"
      }

      rule {
        # Looking for integer overflow attacks, these are taken from skipfish, except 3.0.00738585072007e-308 is the "magic number" crash
        action  = "Log"
        enabled = true
        rule_id = "942220"
      }

      rule {
        # Detects conditional SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942230"
      }

      rule {
        # Detects MySQL charset switch and MSSQL DoS attempts
        action  = "Log"
        enabled = true
        rule_id = "942240"
      }

      rule {
        # Detects MATCH AGAINST, MERGE and EXECUTE IMMEDIATE injections
        action  = "Log"
        enabled = true
        rule_id = "942250"
      }

      rule {
        # Looking for basic sql injection. Common attack string for mysql, oracle, and others.
        action  = "Log"
        enabled = true
        rule_id = "942270"
      }

      rule {
        # Detects Postgres pg_sleep injection, waitfor delay attacks and database shutdown attempts
        action  = "Log"
        enabled = true
        rule_id = "942280"
      }

      rule {
        # Finds basic MongoDB SQL injection attempts
        action  = "Log"
        enabled = true
        rule_id = "942290"
      }

      rule {
        # Detects MySQL comments, conditions, and ch(a)r injections
        action  = "Log"
        enabled = true
        rule_id = "942300"
      }

      rule {
        # Detects chained SQL injection attempts 2/2
        action  = "Log"
        enabled = true
        rule_id = "942310"
      }

      rule {
        # Detects MySQL and PostgreSQL stored procedure/function injections
        action  = "Log"
        enabled = true
        rule_id = "942320"
      }

      rule {
        # Detects classic SQL injection probings 1/2
        action  = "Log"
        enabled = true
        rule_id = "942330"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 3/3
        action  = "Log"
        enabled = true
        rule_id = "942340"
      }

      rule {
        # Detects MySQL UDF injection and other data/structure manipulation attempts
        action  = "Log"
        enabled = true
        rule_id = "942350"
      }

      rule {
        # Detects concatenated basic SQL injection and SQLLFI attempts
        action  = "Log"
        enabled = true
        rule_id = "942360"
      }

      rule {
        # Detects basic SQL injection based on keyword alter or union
        action  = "Log"
        enabled = true
        rule_id = "942361"
      }

      rule {
        # Detects classic SQL injection probings 2/3
        action  = "Log"
        enabled = true
        rule_id = "942370"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942380"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942390"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942410"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942470"
      }

      rule {
        # SQL Injection Attack
        action  = "Log"
        enabled = true
        rule_id = "942480"
      }

      rule {
        # Detects MySQL comment-/space-obfuscated injections and backtick termination
        action  = "Log"
        enabled = true
        rule_id = "942200"
      }

      rule {
        # Detects basic SQL authentication bypass attempts 2/3
        action  = "Log"
        enabled = true
        rule_id = "942260"
      }

      rule {
        # Suspicious use of SQL keywords
        action  = "Log"
        enabled = true
        rule_id = "942400"
      }

      rule {
        # Restricted SQL Character Anomaly Detection (args): # of special characters exceeded (12)
        action  = "Log"
        enabled = true
        rule_id = "942430"
      }

      rule {
        # SQL Comment Sequence Detected
        action  = "Log"
        enabled = true
        rule_id = "942440"
      }

      rule {
        # SQL Hex Encoding Identified
        action  = "Log"
        enabled = true
        rule_id = "942450"
      }
    }

	override {
      rule_group_name = "RCE"

      rule {
        # Remote Command Execution: Direct Unix Command Execution
        action  = "Log"
        enabled = true
        rule_id = "932150"
      }
    }

    # Exception for ASB-2059 - Exclude all rules for this selector.
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "comment"
    }

    # Exclusions for APPLICS-631 - Exclude all rules for this selector.
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "applicant.organisationName"
    }


    # Exception for ASB-1692 merged with ASB-1928 - Exclude all rules for this selector.
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "backOfficeProjectUpdateContent"
    }

    # Exclusions for APPLICS-631 - Exclude all rules for this selector.
    # POST project update content, which is a strict subset of HTML
    # only applies Back Office, so should be removed from others with new Front Door
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "backOfficeProjectUpdateContentWelsh"
    }

    # Exclusions for APPLICS-380 - Exclude all rules for this selector.
    # POST BO project description and locationDescription, POST document fileName
    # only applies Back Office fields.
    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "geographicalInformation.locationDescription"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "geographicalInformation.locationDescriptionWelsh"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "fileName"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "description"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "descriptionWelsh"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "title"
    }

    exclusion {
      match_variable = "RequestBodyPostArgNames"
      operator       = "Equals"
      selector       = "titleWelsh"
    }
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }

  # custom rules in priority order to match the API
  custom_rule {
    name     = "IpBlock"
    action   = "Block"
    enabled  = true
    priority = 10
    type     = "MatchRule"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values = [
        "10.255.255.255" # placeholder value
      ]
    }
  }

  custom_rule {
    name                           = "RateLimitHttpRequest"
    action                         = "Block"
    enabled                        = true
    priority                       = 100
    type                           = "RateLimitRule"
    rate_limit_duration_in_minutes = 5
    rate_limit_threshold           = 1500

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

  lifecycle {
    ignore_changes = [
      # match the first custom rule (IpBlock) and ignore the match values (IPs)
      # managed in Portal
      custom_rule[0].match_condition[0].match_values
    ]
  }
}
