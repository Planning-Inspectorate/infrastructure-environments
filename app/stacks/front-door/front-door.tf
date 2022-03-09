resource "azurerm_frontdoor" "common" {
  #TODO: Add frontend endpoints for custom domains:
  # - Applications: www.national-infrastructure.planninginspectorate.gov.uk
  # - Appeals:      appeal-planning-decision.planninginspectorate.gov.uk
  #checkov:skip=CKV_AZURE_121: WAF to be implemented later
  name                                         = "pins-fd-${local.service_name}-${local.resource_suffix}"
  resource_group_name                          = var.common_resource_group_name
  enforce_backend_pools_certificate_name_check = false
  tags                                         = local.tags

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

  #========================================================================
  # Default Frontend Endpoint
  #========================================================================

  frontend_endpoint {
    name      = "pins-fd-${local.service_name}-${local.resource_suffix}"
    host_name = "pins-fd-${local.service_name}-${local.resource_suffix}.azurefd.net"

    # web_application_firewall_policy_link_id
  }

  backend_pool {
    name                = "Default"
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = "www.gov.uk/government/organisations/planning-inspectorate"
      host_header = "www.gov.uk/government/organisations/planning-inspectorate"
      http_port   = 80
      https_port  = 443
      priority    = 5
      weight      = 100
    }
  }

  routing_rule {
    enabled            = true
    name               = "ForwardHttps"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["pins-fd-${local.service_name}-${local.resource_suffix}"]

    forwarding_configuration {
      backend_pool_name      = "Default"
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  #========================================================================
  # Dynamic Service Frontend Endpoints
  #========================================================================

  dynamic "frontend_endpoint" {
    for_each = local.frontend_mappings
    iterator = mapping
    content {
      name      = mapping.value["name"]
      host_name = mapping.value["frontend_endpoint"]
    }
  }

  dynamic "backend_pool" {
    for_each = local.frontend_mappings
    iterator = mapping
    content {
      name                = "Default"
      load_balancing_name = "Default"
      health_probe_name   = "Http"

      backend {
        enabled     = true
        address     = var.app_service_urls[mapping.key]
        host_header = var.app_service_urls[mapping.key]
        http_port   = 80
        https_port  = 443
        priority    = 1
        weight      = 100
      }
    }
  }

  dynamic "routing_rule" {
    for_each = local.frontend_mappings
    iterator = mapping
    content {
      enabled            = true
      name               = "ForwardHttps"
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = mapping.value["patterns_to_match"]
      frontend_endpoints = ["www.national-infrastructure.planninginspectorate.gov.uk"]

      forwarding_configuration {
        backend_pool_name      = "Default"
        cache_enabled          = false
        cache_query_parameters = []
        forwarding_protocol    = "MatchRequest"
      }
    }
  }
}

# resource "azurerm_frontdoor_custom_https_configuration" "applications_service" {
#   frontend_endpoint_id              = azurerm_frontdoor.common.id
#   custom_https_provisioning_enabled = true

#   custom_https_configuration {
#     certificate_source                      = "AzureKeyVault"
#     azure_key_vault_certificate_secret_name = "applications-service-${var.environment}"
#     azure_key_vault_certificate_vault_id    = azurerm_key_vault.environment_key_vault.id
#   }
# }
