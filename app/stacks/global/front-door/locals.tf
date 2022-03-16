locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
    }
  )

  frontend_endpoint_mappings = {
    applications_frontend = {
      name                 = "ApplicationsService"
      frontend_endpoint    = var.applications_service_public_url
      patterns_to_match    = ["/*"]
      ssl_certificate_name = var.applications_service_ssl_certificate_name
    }
    appeals_frontend = {
      name                 = "AppealsService"
      frontend_endpoint    = var.appeals_service_public_url
      patterns_to_match    = ["/*"]
      ssl_certificate_name = var.appeals_service_ssl_certificate_name
    }
  }

  # The App Service URLs come back in a map that includes the location in the last 4 characters
  # e.g.
  # {
  #   applications_frontend_uks = ...
  # }
  # We chop off the last 4 characters in the key and match it to a mapping in the frontend_endpoint_mappings variable
  # We then create a new map with the key that includes the location, its app service url, and the matched frontend configuration
  backend_pool_mappings = {
    for k, v in var.app_service_urls : k => merge(
      local.frontend_endpoint_mappings[substr(k, 0, length(k) - 4)], { app_service_url = v }
    ) if length(regexall("-wfe-", v)) > 0
  }
}
