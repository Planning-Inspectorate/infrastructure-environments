//resource "azurerm_cosmosdb_account" "odt" {
//  name                = "pins-${module.azure_region_uks.location_short}-odt"
//  location            = azurerm_resource_group.base_infrastructure.location
//  resource_group_name = azurerm_resource_group.base_infrastructure.name
//  offer_type          = "Standard"
//  kind                = "GlobalDocumentDB"
//
//  enable_automatic_failover = true
//
//  capabilities {
//    name = "EnableAggregationPipeline"
//  }
//
//  capabilities {
//    name = "mongoEnableDocLevelTTL"
//  }
//
//  capabilities {
//    name = "MongoDBv3.4"
//  }
//
//
//  consistency_policy {
//    consistency_level       = "BoundedStaleness"
//    max_interval_in_seconds = 350
//    max_staleness_prefix    = 100002
//  }
//
//  geo_location {
//    location          = "UK West"
//    failover_priority = 1
//  }
//
//  geo_location {
//    location          = azurerm_resource_group.base_infrastructure.location
//    failover_priority = 0
//  }
//}
