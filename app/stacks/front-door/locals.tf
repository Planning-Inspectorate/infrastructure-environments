locals {
  # ni_frontend_prefix = split(".azurewebsites.net", var.ni_frontend_url)[0]

  service_name    = "front-door"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region = var.region
    }
  )
}
