locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${var.instance}"

  frontend_endpoint_mappings = {
    applications_frontend = {
      frontend_endpoint = var.applications_service_public_url
      # We won't always have a secondary app service url, so we need to conditionally create the app_service_urls variable
      app_service_urls = var.applications_service_secondary_app_service_url != "" && var.feature_front_door_failover_enaled ? [
        {
          url      = var.applications_service_primary_app_service_url,
          priority = 1
        },
        {
          url      = var.applications_service_secondary_app_service_url,
          priority = 0
        }] : [
        {
          url      = var.applications_service_primary_app_service_url,
          priority = 1
        }
      ]
      infer_backend_host_header = false
      name                      = "ApplicationsService"
      patterns_to_match         = ["/*"]
      search_indexing           = var.enable_search_indexing_by_default
      ssl_certificate_name      = var.applications_service_ssl_certificate_name
    }

    appeals_frontend = {
      frontend_endpoint = var.appeals_service_public_url
      app_service_urls = var.appeals_service_secondary_app_service_url != "" && var.feature_front_door_failover_enaled ? [
        {
          url      = var.appeals_service_primary_app_service_url,
          priority = 1
        },
        {
          url      = var.appeals_service_secondary_app_service_url,
          priority = 0
        }] : [
        {
          url      = var.appeals_service_primary_app_service_url,
          priority = 1
      }]
      infer_backend_host_header = false
      name                      = "AppealsService"
      patterns_to_match         = ["/*"]
      search_indexing           = false
      ssl_certificate_name      = var.appeals_service_ssl_certificate_name
    }

    back_office_frontend = {
      frontend_endpoint = var.back_office_public_url
      app_service_urls = var.back_office_secondary_app_service_url != "" && var.feature_front_door_failover_enaled ? [
        {
          url      = var.back_office_primary_app_service_url,
          priority = 1
        },
        {
          url      = var.back_office_secondary_app_service_url,
          priority = 0
        }] : [
        {
          url      = var.back_office_primary_app_service_url,
          priority = 1
      }]
      infer_backend_host_header = true
      name                      = "BackOffice"
      patterns_to_match         = ["/*"]
      search_indexing           = false
      ssl_certificate_name      = var.back_office_ssl_certificate_name
    }
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
