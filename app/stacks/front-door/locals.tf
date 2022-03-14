locals {
  frontend_mappings = {
    national_infrastructure_frontend = {
      name              = "NationalInfrastructure"
      frontend_endpoint = var.applications_service_public_url
      patterns_to_match = ["/*"]
    }
    appeals_service_frontend = {
      name              = "AppealsService"
      frontend_endpoint = var.appeals_service_public_url
      patterns_to_match = ["/*"]
    }
  }
  service_name    = "common"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region      = var.region
      ServiceName = local.service_name
    }
  )
}
