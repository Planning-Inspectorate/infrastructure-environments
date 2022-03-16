resource "azurerm_cosmosdb_account" "appeals_database" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV_AZURE_100: Customer Managed Keys not implemented yet
  #checkov:skip=CKV_AZURE_140: Local authentication only applicable to SQL API
  name                = "pins-cosmos-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  access_key_metadata_writes_enabled = false
  enable_automatic_failover          = true
  public_network_access_enabled      = false

  mongo_server_version = "3.6"

  capabilities {
    name = "EnableMongo"
  }

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 350
    max_staleness_prefix    = 100002
  }

  geo_location {
    location          = module.azure_region_secondary.location
    failover_priority = 1
  }

  geo_location {
    location          = module.azure_region_primary.location
    failover_priority = 0
  }

  tags = local.tags
}
