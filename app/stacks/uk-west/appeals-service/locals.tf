locals {
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_primary.location_short}-${var.instance}"

  secret_names_exclude = [
    "appeals-app-config-connection-string",
    "application-insights-connection-string"
  ]

  secret_names = [
    for secret_name in module.app_services.secret_names :
    secret_name if !contains(local.secret_names_exclude, secret_name)
  ]

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_primary.location
      ServiceName = local.service_name
    }
  )
}
