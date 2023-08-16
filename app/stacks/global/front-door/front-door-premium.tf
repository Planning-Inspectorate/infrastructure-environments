resource "azurerm_cdn_frontdoor_profile" "common" {
  name                = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  sku_name            = var.front_door_sku_name
}

resource "azurerm_cdn_frontdoor_endpoint" "common" {
  name                     = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "common" {
  name                     = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
  session_affinity_enabled = false

  load_balancing {
    sample_size                        = 4
    successful_samples_required        = 2
    additional_latency_in_milliseconds = 0
  }

  health_probe {
    path                = "/"
    protocol            = "Http"
    request_type        = "GET"
    interval_in_seconds = 120
  }
}

resource "azurerm_cdn_frontdoor_origin" "common" {
  name                          = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.common.id

  enabled                        = true
  host_name                      = "www.gov.uk"
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = "www.gov.uk"
  priority                       = 5
  weight                         = 100
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "common" {
  name                          = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.common.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.common.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.common.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "MatchRequest"
  link_to_default_domain = true
  https_redirect_enabled = true

  cdn_frontdoor_origin_path = "/government/organisations/planning-inspectorate"
}

resource "azurerm_cdn_frontdoor_endpoint" "back_office_applications_service" {
  name                     = local.back_office_frontend.frontend_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "back_office_applications_service" {
  name                     = local.back_office_frontend.frontend_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
  session_affinity_enabled = false

  load_balancing {
    sample_size                        = 4
    successful_samples_required        = 2
    additional_latency_in_milliseconds = 0
  }

  health_probe {
    path                = "/"
    protocol            = "Http"
    request_type        = "GET"
    interval_in_seconds = 120
  }
}

resource "azurerm_cdn_frontdoor_origin" "back_office_applications_service" {
  name                          = local.back_office_frontend.frontend_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_applications_service.id

  enabled                        = true
  host_name                      = local.back_office_frontend.frontend_endpoint
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = local.back_office_frontend.frontend_endpoint
  priority                       = 5
  weight                         = 100
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "back_office_applications_service" {
  name                          = local.back_office_frontend.frontend_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.back_office_applications_service.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_applications_service.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.back_office_applications_service.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "MatchRequest"
  link_to_default_domain = true
  https_redirect_enabled = true
}

resource "azurerm_cdn_frontdoor_endpoint" "back_office_appeals_service" {
  name                     = local.back_office_appeals_frontend.frontend_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "back_office_appeals_service" {
  name                     = local.back_office_appeals_frontend.frontend_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
  session_affinity_enabled = false

  load_balancing {
    sample_size                        = 4
    successful_samples_required        = 2
    additional_latency_in_milliseconds = 0
  }

  health_probe {
    path                = "/"
    protocol            = "Http"
    request_type        = "GET"
    interval_in_seconds = 120
  }
}

resource "azurerm_cdn_frontdoor_origin" "back_office_appeals_service" {
  name                          = local.back_office_appeals_frontend.frontend_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_appeals_service.id

  enabled                        = true
  host_name                      = local.back_office_appeals_frontend.frontend_endpoint
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = local.back_office_appeals_frontend.frontend_endpoint
  priority                       = 5
  weight                         = 100
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "back_office_appeals_service" {
  name                          = local.back_office_appeals_frontend.frontend_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.back_office_appeals_service.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_appeals_service.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.back_office_appeals_service.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "MatchRequest"
  link_to_default_domain = true
  https_redirect_enabled = true
}

resource "azurerm_cdn_frontdoor_custom_domain" "common" {
  name                     = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
  host_name                = "www.gov.uk"

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}

resource "azurerm_cdn_frontdoor_custom_domain_association" "common" {
  cdn_frontdoor_custom_domain_id = azurerm_cdn_frontdoor_custom_domain.common.id
  cdn_frontdoor_route_ids        = [azurerm_cdn_frontdoor_route.common.id, azurerm_cdn_frontdoor_route.back_office_applications_service.id, azurerm_cdn_frontdoor_route.back_office_appeals_service.id]
}

resource "azurerm_cdn_frontdoor_rule_set" "search_indexing" {
  name                     = "searchindex"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
}

resource "azurerm_cdn_frontdoor_rule" "addrobotstagheader" {
  depends_on = [azurerm_cdn_frontdoor_origin_group.common, azurerm_cdn_frontdoor_origin.common]

  name                      = "addrobotstagheader"
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.search_indexing.id
  order                     = 1
  behavior_on_match         = "Continue"

  actions {
    response_header_action {
      header_action = "Append"
      header_name   = "X-Robots-Tag"
      value         = "noindex,nofollow"
    }
  }
}

resource "azurerm_cdn_frontdoor_rule" "book_reference_file" {
  depends_on = [azurerm_cdn_frontdoor_origin_group.common, azurerm_cdn_frontdoor_origin.common]

  name                      = "BookReferenceFileRobotsTag"
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.search_indexing.id
  order                     = 2
  behavior_on_match         = "Continue"

  conditions {
    url_filename_condition {
      operator     = "Contains"
      match_values = ["book", "reference"]
      transforms   = ["Lowercase"]
    }
  }

  actions {
    response_header_action {
      header_action = "Append"
      header_name   = "X-Robots-Tag"
      value         = "noindex,nofollow"
    }
  }
}
