resource "azurerm_frontdoor_custom_https_configuration" "ssl_certificate" {
  for_each = var.frontend_endpoint_mappings

  frontend_endpoint_id              = var.frontend_endpoints[each.value["name"]]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = "AzureKeyVault"
    azure_key_vault_certificate_secret_name = each.value["ssl_certificate_name"]
    azure_key_vault_certificate_vault_id    = var.common_key_vault_id
  }
}
