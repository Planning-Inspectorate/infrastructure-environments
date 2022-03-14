data "azurerm_key_vault_secret" "applications_service_vpn_gateway_shared_key" {
  name         = "applications-service-vpn-gateway-shared-key"
  key_vault_id = var.key_vault_id
}
