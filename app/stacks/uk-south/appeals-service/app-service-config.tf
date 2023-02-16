resource "azurerm_app_configuration" "appeals_service" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-asc-appeals-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  location            = module.azure_region_uks.location
  sku                 = "standard"

  tags = local.tags
}

resource "azurerm_private_endpoint" "appeals_app_config" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-pe-${local.service_name}-asc-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  subnet_id           = azurerm_subnet.appeals_service_ingress.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.app_config.id]
  }

  private_service_connection {
    name                           = "pins-pe-${local.service_name}-asc-${local.resource_suffix}"
    private_connection_resource_id = azurerm_app_configuration.appeals_service[0].id
    subresource_names              = ["configurationStores"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "time_offset" "secret_expire_date" {
  offset_years = 1
}

resource "azurerm_key_vault_secret" "appeals_app_config_endpoint_kv_secret" {
  name            = "appeals-app-config-endpoint"
  value           = azurerm_app_configuration.appeals_service.primary_write_key[0].connection_string
  key_vault_id    = var.key_vault_id
  content_type    = "text/plain"
  expiration_date = time_offset.secret_expire_date.rfc3339
}
