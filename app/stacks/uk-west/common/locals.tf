locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )

  secret_names = [
    "applications-service-encryption-secret-key",
    "applications-service-mysql-database",
    "applications-service-mysql-dialect",
    "applications-service-mysql-host",
    "applications-service-mysql-password",
    "applications-service-mysql-port",
    "applications-service-mysql-username",
    "microsoft_provider_authentication_secret",
    "srv-notify-api-key"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.environment_key_vault.vault_uri}secrets/${name}/)"
  }
}
