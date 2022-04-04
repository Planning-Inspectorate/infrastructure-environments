locals {
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_primary.location_short}-${var.instance}"

  secret_names = [
    "appeals-microsoft-provider-authentication-secret",
    "appeals-srv-notify-api-key"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_primary.location
      ServiceName = local.service_name
    }
  )
}
