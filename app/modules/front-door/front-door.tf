resource "azurerm_cdn_frontdoor_profile" "default" {
  name                = "${local.service_name}-${local.environment}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  sku_name            = var.sku_name

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "default" {
  name                     = "${local.service_name}-${local.environment}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "default" {
  name                     = "${local.service_name}-${local.environment}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
  session_affinity_enabled = false

  health_probe {
    interval_in_seconds = 240
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 16
    successful_samples_required        = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "default" {
  name                          = "${local.service_name}-${local.environment}"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.default.id

  enabled                        = true
  host_name                      = var.blob_storage_endpoint
  certificate_name_check_enabled = true

  # private_link {
  #   request_message        = "Request access for Private Link Origin CDN Frontdoor"
  #   target_type            = "blob"
  #   location               = var.location
  #   private_link_target_id = var.storage_account_id
  # }
}

resource "azurerm_cdn_frontdoor_route" "default" {
  name                          = "${local.service_name}-${local.environment}"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.default.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.default.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.default.id]

  forwarding_protocol = "MatchRequest" # TODO: Why is this not HttpsOnly
  patterns_to_match   = ["/*"]
  supported_protocols = ["Http", "Https"] # TODO: Why do we accept http

  cdn_frontdoor_origin_path = "/"

  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.default.id]
}

resource "azurerm_cdn_frontdoor_custom_domain" "default" {
  name                     = "${local.service_name}-${local.environment}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
  host_name                = var.domain_name

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}

resource "azurerm_cdn_frontdoor_custom_domain_association" "default" {
  cdn_frontdoor_custom_domain_id = azurerm_cdn_frontdoor_custom_domain.default.id
  cdn_frontdoor_route_ids        = [azurerm_cdn_frontdoor_route.default.id]
}
