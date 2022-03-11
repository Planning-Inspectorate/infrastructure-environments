locals {
  frontend_url    = "https://pins-app-${local.service_name}-appeals-wfe-${local.resource_suffix}.azurewebsites.net/"
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region = var.region
    }
  )
}
