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
    path                = "/"
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

  #========================================================================
  # Dynamic Service Frontend Endpoints
  #========================================================================

  dynamic "frontend_endpoint" {
    for_each = local.frontend_endpoint_mappings
    iterator = mapping

    content {
      name                                    = mapping.value["name"]
      host_name                               = mapping.value["frontend_endpoint"]
      web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
    }
  }

  dynamic "backend_pool" {
    for_each = local.backend_pool_mappings
    iterator = mapping

    content {
      name                = mapping.value["name"]
      load_balancing_name = "Default"
      health_probe_name   = "Http"

      backend {
        enabled     = true
        address     = mapping.value["app_service_url"]
        host_header = mapping.value["app_service_url"]
        http_port   = 80
        https_port  = 443
        priority    = 1
        weight      = 100
      }
    }
  }

  dynamic "routing_rule" {
    for_each = local.backend_pool_mappings
    iterator = mapping

    content {
      enabled            = true
      name               = mapping.value["name"]
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = mapping.value["patterns_to_match"]
      frontend_endpoints = [mapping.value["name"]]

      forwarding_configuration {
        backend_pool_name      = mapping.value["name"]
        cache_enabled          = false
        cache_query_parameters = []
        forwarding_protocol    = "MatchRequest"
      }
    }
  }

  tags = local.tags
}
