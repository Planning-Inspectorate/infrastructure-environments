resource "azurerm_key_vault_secret" "redis_cache_connection_string" {
  count = var.is_dr_deployment ? 1 : 0

  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114
  key_vault_id = var.key_vault_id
  name         = "applications-service-redis-cache-connection-string"
  value        = azurerm_redis_cache.applications_service_redis_cache[count.index].primary_connection_string
}
