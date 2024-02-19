resource "azurerm_cdn_frontdoor_profile" "default" {
  count = var.environment == dev ? 1 : 0

  name                = "${var.service_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  sku_name            = "Premium_AzureFrontDoor"

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "default" {
  name                     = var.service_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "default" {
  name                     = var.service_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
  session_affinity_enabled = false

  health_probe {
    interval_in_seconds = 240
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }
}

resource "azurerm_cdn_frontdoor_origin" "default" {
  name                          = var.service_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.default.id

  enabled   = true
  host_name = var.app_service_url
}
# TODO Private Link, will require certificate_name_check_enabled

resource "azurerm_cdn_frontdoor_route" "default" {
  name                          = var.service_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.default.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.default.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.default.id]

  forwarding_protocol = "MatchRequest" # TODO: Why is this not HttpsOnly
  patterns_to_match   = ["/*"]
  supported_protocols = ["Http", "Https"] # TODO: Why do we accept http

  cdn_frontdoor_origin_path = "/"
}

resource "azurerm_cdn_frontdoor_custom_domain" "default" {
  name                     = var.service_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.default.id
  host_name                = var.domain_name

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}
