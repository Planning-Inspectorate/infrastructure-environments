locals {
  frontend_url    = "https://pins-app-${local.service_name}-ni-wfe-${local.resource_suffix}.azurewebsites.net/"
  service_name    = "applications-service"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  tags = merge(
    var.common_tags,
    {
      Region = var.region
    }
  )

  secret_names = [
    "APPLICATIONS_SERVICE_ENCRYPTION_SECRET_KEY",
    "APPLICATIONS_SERVICE_MYSQL_HOST",
    "APPLICATIONS_SERVICE_MYSQL_PASSWORD",
    "APPLICATIONS_SERVICE_MYSQL_USERNAME",
    "SRV_NOTIFY_API_KEY"
  ]
  secrets = {
    for name in local.secret_names :
    name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/${data.azurerm_key_vault_secret.secret[name].version})"
  }
}
