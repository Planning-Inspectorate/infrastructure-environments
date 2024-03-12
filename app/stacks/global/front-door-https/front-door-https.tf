resource "azurerm_frontdoor_custom_https_configuration" "ssl_certificate" {
  for_each = var.frontend_endpoint_mappings

  frontend_endpoint_id              = var.frontend_endpoints[each.value["frontend_name"]]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source                      = var.use_managed_cert_map[each.value.frontend_name] ? "FrontDoor" : "AzureKeyVault"
    azure_key_vault_certificate_secret_name = var.use_managed_cert_map[each.value.frontend_name] ? null : each.value["ssl_certificate_name"]
    azure_key_vault_certificate_vault_id    = var.use_managed_cert_map[each.value.frontend_name] ? null : var.common_key_vault_id
  }
}

resource "azurerm_frontdoor_custom_https_configuration" "back_office_old_url_ssl_certificate" {
  for_each = toset(var.back_office_public_url_new == null ? [] : ["apply"])

  frontend_endpoint_id              = var.frontend_endpoints["BackOffice"]
  custom_https_provisioning_enabled = true

  custom_https_configuration {
    certificate_source = "FrontDoor"
  }
}
