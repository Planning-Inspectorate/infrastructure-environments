## Back Office Applications
resource "azurerm_redis_cache" "back_office_applications_redis_cache" {
  capacity                      = var.redis_cache_configuration["capacity"]
  family                        = var.redis_cache_configuration["family"]
  location                      = azurerm_resource_group.back_office_stack.location
  name                          = "pins-redis-cache-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku_name                      = var.redis_cache_configuration["sku_name"]
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"
}

resource "azurerm_private_endpoint" "back_office_applications_redis_cache" {
  name                = "pins-redis-cache-private-endpoint-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.back_office_applications_redis_cache_dns_zone.id]
  }

  private_service_connection {
    name                           = "pins-redis-cache-private-service-connection-${local.service_name}-${local.resource_suffix}"
    private_connection_resource_id = azurerm_redis_cache.back_office_applications_redis_cache.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }
}

resource "azurerm_private_dns_zone" "back_office_applications_redis_cache_dns_zone" {
  name                = "privatelink.backoffice.applications.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.back_office_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "back_office_applications_redis_cache_dns_link" {
  name                  = "back-office-applications-redis-cache-dns-link"
  resource_group_name   = azurerm_resource_group.back_office_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.back_office_applications_redis_cache_dns_zone.name
  virtual_network_id    = var.common_vnet_id
}

## Back Office Appeals
resource "azurerm_redis_cache" "back_office_appeals_redis_cache" {
  capacity                      = var.redis_cache_configuration["capacity"]
  family                        = var.redis_cache_configuration["family"]
  location                      = azurerm_resource_group.back_office_stack.location
  name                          = "pins-redis-cache-${local.service_name}-appeals-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  sku_name                      = var.redis_cache_configuration["sku_name"]
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"
}

resource "azurerm_private_endpoint" "back_office_appeals_redis_cache" {
  name                = "pins-redis-cache-private-endpoint-${local.service_name}-appeals-${local.resource_suffix}"
  location            = azurerm_resource_group.back_office_stack.location
  resource_group_name = azurerm_resource_group.back_office_stack.name
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.back_office_appeals_redis_cache_dns_zone.id]
  }

  private_service_connection {
    name                           = "pins-redis-cache-private-service-connection-${local.service_name}-appeals-${local.resource_suffix}"
    private_connection_resource_id = azurerm_redis_cache.back_office_appeals_redis_cache.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }
}

resource "azurerm_private_dns_zone" "back_office_appeals_redis_cache_dns_zone" {
  name                = "privatelink.backoffice.appeals.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.back_office_stack.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "back_office_appeals_redis_cache_dns_link" {
  name                  = "back-office-appeals-redis-cache-dns-link"
  resource_group_name   = azurerm_resource_group.back_office_stack.name
  private_dns_zone_name = azurerm_private_dns_zone.back_office_appeals_redis_cache_dns_zone.name
  virtual_network_id    = var.common_vnet_id
}

## secrets
resource "azurerm_key_vault_secret" "back_office_applications_redis_cache_connection_string_secret" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-applications-redis-cache-connection-string"
  value        = azurerm_redis_cache.back_office_applications_redis_cache.primary_connection_string

  tags = local.tags
}

resource "azurerm_key_vault_secret" "back_office_appeals_redis_cache_connection_string_secret" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-appeals-redis-cache-connection-string"
  value        = azurerm_redis_cache.back_office_appeals_redis_cache.primary_connection_string

  tags = local.tags
}
