resource "azurerm_redis_cache" "applications_service_redis_cache" {
  count = var.is_dr_deployment ? 1 : 0

  location                      = azurerm_resource_group.applications_service_stack.location
  name                          = "pins-redis-cache-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.applications_service_stack.name
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"
  capacity                      = var.redis_cache_configuration.capacity
  family                        = var.redis_cache_configuration.family
  sku_name                      = var.redis_cache_configuration.sku_name
}

resource "azurerm_private_endpoint" "applications_service_redis_cache" {
  count = var.is_dr_deployment ? 1 : 0

  name                = "pins-redis-cache-private-endpoint-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.applications_service_stack.location
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  subnet_id           = azurerm_subnet.applications_service_ingress.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.redis_cache.id]
  }

  private_service_connection {
    name                           = "pins-redis-cache-private-service-connection-${local.service_name}-${local.resource_suffix}"
    private_connection_resource_id = azurerm_redis_cache.applications_service_redis_cache[count.index].id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }
}
