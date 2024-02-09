locals {
  all_action_groups = toset([
    "appeals-fo-tech",
    "appeals-bo-tech",
    "applications-fo-tech",
    "applications-bo-tech",
    "appeals-fo-service-manager",
    "appeals-bo-service-manager",
    "applications-fo-service-manager",
    "applications-bo-service-manager",
    "iap", # infrastructure and platforms team
    "its", # issue, triage, and support team
    "info-sec"
  ])

  service_name    = "common"
  resource_suffix = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
