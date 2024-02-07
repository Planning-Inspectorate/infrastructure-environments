locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${var.instance}"

  back_office_appeals_primary_mapping = {
    url      = var.back_office_appeals_primary_app_service_url,
    priority = 1
  }

  back_office_appeals_secondary_mapping = {
    url      = var.back_office_appeals_secondary_app_service_url,
    priority = 0
  }

  back_office_appeals_frontend = {
    frontend_endpoint = var.back_office_appeals_public_url
    app_service_urls = local.back_office_appeals_secondary_mapping.url != "" && var.feature_front_door_failover_enabled ? [
      local.back_office_appeals_primary_mapping,
      local.back_office_appeals_secondary_mapping] : [
      local.back_office_appeals_primary_mapping
    ]
    infer_backend_host_header = false
    name                      = "BackOfficeAppeals"
    frontend_name             = "BackOfficeAppeals"
    patterns_to_match         = ["/*"]
    ssl_certificate_name      = var.back_office_appeals_ssl_certificate_name
  }

  frontend_endpoint_mappings = [{
    name            = "BackOfficeAppeals"
    search_indexing = false
  }]

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
