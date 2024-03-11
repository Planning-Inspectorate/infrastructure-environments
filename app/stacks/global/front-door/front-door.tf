resource "azurerm_frontdoor" "common" {
  #checkov:skip=CKV_AZURE_121: WAF implemented but Checkov still fails: https://github.com/bridgecrewio/checkov/issues/2617
  name                = "pins-fd-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.frontdoor.name

  backend_pool_load_balancing {
    name                            = "Default"
    sample_size                     = 4
    successful_samples_required     = 2
    additional_latency_milliseconds = 0
  }

  backend_pool_health_probe {
    enabled             = true
    name                = "Http"
    path                = "/health"
    protocol            = "Http"
    probe_method        = "GET"
    interval_in_seconds = 120
  }

  backend_pool_settings {
    enforce_backend_pools_certificate_name_check = false
  }

  #========================================================================
  # Default Frontend Endpoint
  #========================================================================

  frontend_endpoint {
    name                                    = "pins-fd-${local.service_name}-${local.resource_suffix}"
    host_name                               = "pins-fd-${local.service_name}-${local.resource_suffix}.azurefd.net"
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  backend_pool {
    name                = "Default"
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = "www.gov.uk"
      host_header = "www.gov.uk"
      http_port   = 80
      https_port  = 443
      priority    = 5
      weight      = 100
    }
  }

  routing_rule {
    enabled            = true
    name               = "Default"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["pins-fd-${local.service_name}-${local.resource_suffix}"]

    forwarding_configuration {
      backend_pool_name      = "Default"
      cache_enabled          = false
      cache_query_parameters = []
      custom_forwarding_path = "/government/organisations/planning-inspectorate"
      forwarding_protocol    = "MatchRequest"
    }
  }

  # We can't use loops because then ordering is calculated alphabetically, and then we can't extend without over-writing things

  # Frontend Endpoints
  frontend_endpoint {
    name                                    = local.applications_frontend.frontend_name
    host_name                               = local.applications_frontend.frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  frontend_endpoint {
    name                                    = local.back_office_frontend.frontend_name
    host_name                               = local.back_office_frontend.frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.back_office_applications_frontend.id
  }

  frontend_endpoint {
    name                                    = local.appeals_frontend.frontend_name
    host_name                               = local.appeals_frontend.frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.appeals_frontend.id
  }

  frontend_endpoint {
    name                                    = local.back_office_appeals_frontend.frontend_name
    host_name                               = local.back_office_appeals_frontend.frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  frontend_endpoint {
    name                                    = local.comment_planning_appeal_frontend.frontend_name
    host_name                               = local.comment_planning_appeal_frontend.frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  dynamic "frontend_endpoint" {
    for_each = local.back_office_frontend.frontend_endpoint_new == null ? [] : ["apply"]

    content {
      name                                    = local.back_office_frontend.frontend_name_new
      host_name                               = local.back_office_frontend.frontend_endpoint_new
      web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.back_office_applications_frontend.id
    }
  }

  # Backend Pools
  backend_pool {
    name                = local.appeals_frontend.name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    dynamic "backend" {
      for_each = local.appeals_frontend.app_service_urls
      iterator = app_service_url

      content {
        enabled     = true
        address     = app_service_url.value["url"]
        host_header = local.appeals_frontend.infer_backend_host_header ? "" : app_service_url.value["url"]
        http_port   = 80
        https_port  = 443
        priority    = app_service_url.value["priority"]
        weight      = 100
      }
    }
  }

  backend_pool {
    name                = local.applications_frontend.name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    dynamic "backend" {
      for_each = local.applications_frontend.app_service_urls
      iterator = app_service_url

      content {
        enabled     = true
        address     = app_service_url.value["url"]
        host_header = local.applications_frontend.infer_backend_host_header ? "" : app_service_url.value["url"]
        http_port   = 80
        https_port  = 443
        priority    = app_service_url.value["priority"]
        weight      = 100
      }
    }
  }

  backend_pool {
    name                = local.back_office_frontend.name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    dynamic "backend" {
      for_each = local.back_office_frontend.app_service_urls
      iterator = app_service_url

      content {
        enabled     = true
        address     = app_service_url.value["url"]
        host_header = local.back_office_frontend.infer_backend_host_header ? "" : app_service_url.value["url"]
        http_port   = 80
        https_port  = 443
        priority    = app_service_url.value["priority"]
        weight      = 100
      }
    }
  }

  backend_pool {
    name                = local.back_office_appeals_frontend.name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    dynamic "backend" {
      for_each = local.back_office_appeals_frontend.app_service_urls
      iterator = app_service_url

      content {
        enabled     = true
        address     = app_service_url.value["url"]
        host_header = local.back_office_appeals_frontend.infer_backend_host_header ? "" : app_service_url.value["url"]
        http_port   = 80
        https_port  = 443
        priority    = app_service_url.value["priority"]
        weight      = 100
      }
    }
  }

  backend_pool {
    name                = local.comment_planning_appeal_frontend.name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    dynamic "backend" {
      for_each = local.comment_planning_appeal_frontend.app_service_urls
      iterator = app_service_url

      content {
        enabled     = true
        address     = app_service_url.value["url"]
        host_header = local.comment_planning_appeal_frontend.infer_backend_host_header ? "" : app_service_url.value["url"]
        http_port   = 80
        https_port  = 443
        priority    = app_service_url.value["priority"]
        weight      = 100
      }
    }
  }


  # Routing Rules
  routing_rule {
    enabled            = true
    name               = local.appeals_frontend.name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.appeals_frontend.patterns_to_match
    frontend_endpoints = [local.appeals_frontend.frontend_name]

    forwarding_configuration {
      backend_pool_name      = local.appeals_frontend.name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  routing_rule {
    enabled            = true
    name               = local.applications_frontend.name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.applications_frontend.patterns_to_match
    frontend_endpoints = [local.applications_frontend.frontend_name]

    forwarding_configuration {
      backend_pool_name      = local.applications_frontend.name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  routing_rule {
    enabled            = true
    name               = local.back_office_frontend.name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.back_office_frontend.patterns_to_match
    frontend_endpoints = (local.back_office_frontend.frontend_endpoint_new == null ?
      [local.back_office_frontend.frontend_name] :
      [
        local.back_office_frontend.frontend_name,
        local.back_office_frontend.frontend_name_new
      ]
    )

    forwarding_configuration {
      backend_pool_name      = local.back_office_frontend.name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  routing_rule {
    enabled            = true
    name               = local.back_office_appeals_frontend.name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.back_office_appeals_frontend.patterns_to_match
    frontend_endpoints = [local.back_office_appeals_frontend.frontend_name]

    forwarding_configuration {
      backend_pool_name      = local.back_office_appeals_frontend.name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  routing_rule {
    enabled            = true
    name               = local.comment_planning_appeal_frontend.name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.comment_planning_appeal_frontend.patterns_to_match
    frontend_endpoints = [local.comment_planning_appeal_frontend.frontend_name]

    forwarding_configuration {
      backend_pool_name      = local.comment_planning_appeal_frontend.name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  tags = local.tags
}

resource "azurerm_frontdoor_rules_engine" "search_indexing" {
  name                = "searchindex"
  frontdoor_name      = azurerm_frontdoor.common.name
  resource_group_name = azurerm_frontdoor.common.resource_group_name

  rule {
    name     = "addrobotstagheader"
    priority = 1

    action {
      response_header {
        header_action_type = "Append"
        header_name        = "X-Robots-Tag"
        value              = "noindex,nofollow"
      }
    }
  }

  rule {
    name     = "BookReferenceFileRobotsTag"
    priority = 2

    match_condition {
      variable  = "RequestFilename"
      operator  = "Contains"
      value     = ["book", "reference"]
      transform = ["Lowercase"]
    }

    action {
      response_header {
        header_action_type = "Append"
        header_name        = "X-Robots-Tag"
        value              = "noindex,nofollow"
      }
    }
  }
}

resource "azurerm_cdn_frontdoor_profile" "common" {
  name                = "common-profile"
  resource_group_name = azurerm_frontdoor.common.resource_group_name
  sku_name            = "Premium_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_origin_group" "common" {
  name                     = "common-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  load_balancing {}
}

resource "azurerm_cdn_frontdoor_origin" "common" {
  name                           = "common-origin"
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.common.id
  enabled                        = true
  certificate_name_check_enabled = true

  host_name          = local.back_office_blob_storage.primary_blob_host
  origin_host_header = local.back_office_blob_storage.primary_blob_host
  priority           = 1
  weight             = 500

  private_link {
    request_message        = "Request access for Private Link Origin CDN Frontdoor"
    target_type            = "blob"
    location               = local.back_office_blob_storage.location
    private_link_target_id = local.back_office_blob_storage.id
  }
}

# Terraform does not yet support linking Rules Engine to Routing rules so using local-exec to run the required Azure CLI command
resource "null_resource" "fd_routing_noindex" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "az config set extension.use_dynamic_install=yes_without_prompt; for RULE_NAME in ${local.search_indexing_rule_backends}; do az network front-door routing-rule update --front-door-name ${azurerm_frontdoor.common.name} --resource-group ${azurerm_frontdoor.common.resource_group_name} --name $RULE_NAME --rules-engine ${azurerm_frontdoor_rules_engine.search_indexing.name}; done"
  }

  # forces execution to go after front door and WAF policy
  depends_on = [
    azurerm_frontdoor.common,
    azurerm_frontdoor_firewall_policy.default
  ]
}
