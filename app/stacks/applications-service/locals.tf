locals {
  service_name    = "applications-service"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region = var.region
    }
  )
}
