locals {
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_primary.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_primary.location
      ServiceName = local.service_name
    }
  )
}
