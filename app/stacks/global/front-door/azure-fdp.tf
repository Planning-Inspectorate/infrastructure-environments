resource "azurerm_cdn_frontdoor_profile" "azure_fdp_test" {
  name                = "azre-fdp-test-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  sku_name            = var.front_door_sku_name
}

resource "azurerm_cdn_frontdoor_endpoint" "back_office_appeals_frontend_endpoint" {
  name                     = "azure-fdp-test${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.azure_fdp_test.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "back_office_appeals_frontend_origin_group" {
  name                     = "azure-fdp-test${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.azure_fdp_test.id
  session_affinity_enabled = true

  health_probe {
    interval_in_seconds = 240
    path                = "/healthProbe"
    protocol            = "Https"
    request_type        = "HEAD"
  }

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 4
    successful_samples_required        = 1
  }
}

resource "azurerm_cdn_frontdoor_origin" "back_office_appeals_frontend_origin" {
  name                           = "azure-fdp-test-${local.resource_suffix}"
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend_origin_group.id
  enabled                        = true

  certificate_name_check_enabled = false

  host_name          = "gov.uk"
  http_port          = 80
  https_port         = 443
  origin_host_header = "www.gov.uk"
  priority           = 1
  weight             = 1000
}

# resource "azurerm_cdn_frontdoor_route" "back_office_appeals_frontend" {
#   name                          = "pins-fdp-${local.service_name}-${local.resource_suffix}"
#   cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.back_office_appeals_frontend.id
#   cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend.id
#   cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.back_office_appeals_frontend.id]

#   supported_protocols    = ["Http", "Https"]
#   patterns_to_match      = ["/*"]
#   forwarding_protocol    = "HttpsOnly"
#   link_to_default_domain = true
#   https_redirect_enabled = true

#   cdn_frontdoor_origin_path = "/government/organisations/planning-inspectorate"
# }
