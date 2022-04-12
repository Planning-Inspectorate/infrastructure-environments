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
  # Applications Service Frontend Endpoints
  #========================================================================

  frontend_endpoint {
    name                                    = local.frontend_endpoint_mappings["applications_frontend"].name
    host_name                               = local.frontend_endpoint_mappings["applications_frontend"].frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  backend_pool {
    name                = local.frontend_endpoint_mappings["applications_frontend"].name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = local.backend_pool_mappings["applications_frontend"].app_service_url
      host_header = local.backend_pool_mappings["applications_frontend"].app_service_url
      http_port   = 80
      https_port  = 443
      priority    = 1
      weight      = 100
    }
  }

  routing_rule {
    enabled            = true
    name               = local.backend_pool_mappings["applications_frontend"].name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.backend_pool_mappings["applications_frontend"].patterns_to_match
    frontend_endpoints = [local.backend_pool_mappings["applications_frontend"].name]

    forwarding_configuration {
      backend_pool_name      = local.backend_pool_mappings["applications_frontend"].name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  #========================================================================
  # Appeals Service Frontend Endpoints
  #========================================================================

  frontend_endpoint {
    name                                    = local.frontend_endpoint_mappings["appeals_frontend"].name
    host_name                               = local.frontend_endpoint_mappings["appeals_frontend"].frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  backend_pool {
    name                = local.frontend_endpoint_mappings["appeals_frontend"].name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = local.backend_pool_mappings["appeals_frontend"].app_service_url
      host_header = local.backend_pool_mappings["appeals_frontend"].app_service_url
      http_port   = 80
      https_port  = 443
      priority    = 1
      weight      = 100
    }
  }

  routing_rule {
    enabled            = true
    name               = local.backend_pool_mappings["appeals_frontend"].name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.backend_pool_mappings["appeals_frontend"].patterns_to_match
    frontend_endpoints = [local.backend_pool_mappings["appeals_frontend"].name]

    forwarding_configuration {
      backend_pool_name      = local.backend_pool_mappings["appeals_frontend"].name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  #========================================================================
  # Back Office Service Frontend Endpoints
  #========================================================================

  frontend_endpoint {
    name                                    = local.frontend_endpoint_mappings["back_office_frontend"].name
    host_name                               = local.frontend_endpoint_mappings["back_office_frontend"].frontend_endpoint
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
  }

  backend_pool {
    name                = local.frontend_endpoint_mappings["back_office_frontend"].name
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = local.backend_pool_mappings["back_office_frontend"].app_service_url
      host_header = local.backend_pool_mappings["back_office_frontend"].app_service_url
      http_port   = 80
      https_port  = 443
      priority    = 1
      weight      = 100
    }
  }

  routing_rule {
    enabled            = true
    name               = local.backend_pool_mappings["back_office_frontend"].name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = local.backend_pool_mappings["back_office_frontend"].patterns_to_match
    frontend_endpoints = [local.backend_pool_mappings["back_office_frontend"].name]

    forwarding_configuration {
      backend_pool_name      = local.backend_pool_mappings["back_office_frontend"].name
      cache_enabled          = false
      cache_query_parameters = []
      forwarding_protocol    = "MatchRequest"
    }
  }

  tags = local.tags
}

resource "azurerm_frontdoor_custom_https_configuration" "applications_service_ssl_certificate" {
  frontend_endpoint_id              = azurerm_frontdoor.common.frontend_endpoints["ApplicationsService"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = "AzureKeyVault"
    azure_key_vault_certificate_secret_name = local.frontend_endpoint_mappings["applications_frontend"]["ssl_certificate_name"]
    azure_key_vault_certificate_vault_id    = var.common_key_vault_id
  }
}

resource "azurerm_frontdoor_custom_https_configuration" "appeals_service_ssl_certificate" {
  frontend_endpoint_id              = azurerm_frontdoor.common.frontend_endpoints["AppealsService"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = "AzureKeyVault"
    azure_key_vault_certificate_secret_name = local.frontend_endpoint_mappings["appeals_frontend"]["ssl_certificate_name"]
    azure_key_vault_certificate_vault_id    = var.common_key_vault_id
  }
}

resource "azurerm_frontdoor_custom_https_configuration" "back_office_ssl_certificate" {
  frontend_endpoint_id              = azurerm_frontdoor.common.frontend_endpoints["BackOffice"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = "AzureKeyVault"
    azure_key_vault_certificate_secret_name = local.frontend_endpoint_mappings["back_office_frontend"]["ssl_certificate_name"]
    azure_key_vault_certificate_vault_id    = var.common_key_vault_id
  }
}
