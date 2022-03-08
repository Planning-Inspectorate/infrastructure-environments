resource "azurerm_frontdoor" "common" {
  #checkov:skip=CKV_AZURE_121: WAF to be implemented later
  name                                         = "pins-fd-${local.service_name}-${local.resource_suffix}"
  resource_group_name                          = var.common_resource_group_name
  enforce_backend_pools_certificate_name_check = false
  tags                                         = local.tags

  frontend_endpoint {
    name      = "pins-fd-${local.service_name}-${local.resource_suffix}"
    host_name = "pins-fd-${local.service_name}-${local.resource_suffix}.azurefd.net"

    # host_name = "${local.ni_frontend_prefix}.azurefd.net"
    # host_name = var.environment == "prod" ? "${local.ni_frontend_prefix}.azurefd.net" : "${local.ni_frontend_prefix}-${var.environment}.azurefd.net"
    # web_application_firewall_policy_link_id
  }

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

  backend_pool {
    name                = "NationalInfrastructureFrontend"
    load_balancing_name = "Default"
    health_probe_name   = "Http"

    backend {
      enabled     = true
      address     = var.ni_frontend_url
      host_header = var.ni_frontend_url
      http_port   = 80
      https_port  = 443
      priority    = 1
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
      backend_pool_name   = "NationalInfrastructureFrontend"
      cache_enabled       = false
      forwarding_protocol = "MatchRequest"
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
