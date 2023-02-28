locals {
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_primary.location_short}-${var.instance}"

  secret_names_exclude = [
    "appeals-app-config-connection-string"
  ]
  secret_names = toset([
    for secret in module.app_services.secret_names :
    secret.name
    if !contains(local.secret_names_exclude, secret.name)
  ])

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_primary.location
      ServiceName = local.service_name
    }
  )
}
