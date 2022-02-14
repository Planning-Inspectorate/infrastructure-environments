resource "azurerm_cosmosdb_account" "odt" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV_AZURE_100: Customer Managed Keys not implemented yet
  name                = "pins-${module.azure_region_uks.location_short}-odt"
  location            = azurerm_resource_group.base_infrastructure.location
  resource_group_name = azurerm_resource_group.base_infrastructure.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  access_key_metadata_writes_enabled = false
  enable_automatic_failover          = true
  public_network_access_enabled      = false

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }


  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 350
    max_staleness_prefix    = 100002
  }

  geo_location {
    location          = "UK West"
    failover_priority = 1
  }

  geo_location {
    location          = azurerm_resource_group.base_infrastructure.location
    failover_priority = 0
  }
}
