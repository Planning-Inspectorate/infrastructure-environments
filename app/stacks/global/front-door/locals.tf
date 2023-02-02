locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${var.instance}"

  frontend_endpoint_mappings = {
    applications_frontend = {
      frontend_endpoint         = var.applications_service_public_url
      infer_backend_host_header = false
      name                      = "ApplicationsService"
      patterns_to_match         = ["/*"]
      search_indexing           = var.enable_search_indexing_by_default
      ssl_certificate_name      = var.applications_service_ssl_certificate_name
    }
    appeals_frontend = {
      frontend_endpoint         = var.appeals_service_public_url
      infer_backend_host_header = false
      name                      = "AppealsService"
      patterns_to_match         = ["/*"]
      search_indexing           = false
      ssl_certificate_name      = var.appeals_service_ssl_certificate_name
    }
    back_office_frontend = {
      frontend_endpoint         = var.back_office_public_url
      infer_backend_host_header = true
      name                      = "BackOffice"
      patterns_to_match         = ["/*"]
      search_indexing           = false
      ssl_certificate_name      = var.back_office_ssl_certificate_name
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

  # This variable is used in a bash script to loop through some Azure CLI commands that cannot conflict
  # We cannot use a terraform for_each loop for the null_resource since these all run in parallel. Hence the loop is done within the command
  # Bash requires a space separate string to loop through.
  search_indexing_rule_backends = join(" ", [for mapping in local.frontend_endpoint_mappings : mapping["name"] if mapping["search_indexing"] == false])

  tags = merge(
    var.common_tags,
    {
      ServiceName = local.service_name
      Region      = "Global"
    }
  )
}
