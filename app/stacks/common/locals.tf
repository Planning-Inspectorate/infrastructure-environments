locals {
  service_name    = "common"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region = var.region
    }
  )

  secret_names = [
    "applications-service-encryption-secret-key",
    "applications-service-mysql-host",
    "applications-service-mysql-password",
    "applications-service-mysql-username",
    "applications-service-vpn-gateway-shared-key",
    "srv-notify-api-key"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.environment_key_vault.vault_uri}secrets/${name}"
  }
}
