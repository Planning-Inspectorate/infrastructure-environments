resource "azurerm_cdn_frontdoor_profile" "common" {
  name                = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.frontdoor.name
  sku_name            = var.front_door_sku_name
}

resource "azurerm_cdn_frontdoor_endpoint" "back_office_appeals_frontend" {
  name                     = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id

  tags = local.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "back_office_appeals_frontend" {
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

resource "azurerm_cdn_frontdoor_origin" "back_office_appeals_frontend" {
  name                          = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend.id

  enabled                        = true
  host_name                      = "www.gov.uk"
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = "www.gov.uk"
  priority                       = 5
  weight                         = 100
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "back_office_appeals_frontend" {
  name                          = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.back_office_appeals_frontend.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.back_office_appeals_frontend.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "HttpsOnly"
  link_to_default_domain = true
  https_redirect_enabled = true

  cdn_frontdoor_origin_path = "/government/organisations/planning-inspectorate"
}

# resource "azurerm_cdn_profile" "back_office" {
#   name                = "back_office"
#   location            = var.location
#   resource_group_name = azurerm_resource_group
#   sku                 = "Standard_Verizon"
# }

resource "azurerm_cdn_frontdoor_custom_domain" "common" {
  name                     = "pins-fdp-${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
  host_name                = "www.gov.uk"

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}

resource "azurerm_cdn_frontdoor_rule_set" "common" {
  name                     = "${local.service_name}-${local.resource_suffix}"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common.id
}

# resource "azurerm_cdn_frontdoor_rule" "addrobotstagheader" {
#   depends_on = [azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend, azurerm_cdn_frontdoor_origin.back_office_appeals_frontend]

#   name                      = "addrobotstagheader"
#   cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.common.id
#   order                     = 1
#   behavior_on_match         = "Continue"

#   actions {
#     response_header_action {
#       header_action_type = "Append"
#       header_name        = "X-Robots-Tag"
#       value              = "noindex,nofollow"
#     }
#   }

# resource "azurerm_cdn_frontdoor_rule" "search_indexing" {
# depends_on = [azurerm_cdn_frontdoor_origin_group.back_office_appeals_frontend, azurerm_cdn_frontdoor_origin.back_office_appeals_frontend]

# name                      = "Book Reference File Robots Tag"
# cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.common.id
# order                     = 2
# behavior_on_match         = "Continue"

#   conditions {
#     url_filename_condition {
#       variable  = "RequestFilename"
#       operator  = "Contains"
#       value     = ["book", "reference"]
#       transforms = ["Lowercase"]
#     }
#   }

#   actions {
#     response_header_action {
#       header_action_type = "Append"
#       header_name        = "X-Robots-Tag"
#       value              = "noindex,nofollow"
#     }
#   }
# }
