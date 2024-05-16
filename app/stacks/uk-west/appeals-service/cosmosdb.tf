resource "azurerm_cosmosdb_account" "appeals_database" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV_AZURE_100: Customer Managed Keys not implemented yet
  #checkov:skip=CKV_AZURE_132: Allow metadata writes
  #checkov:skip=CKV_AZURE_140: Local authentication only applicable to SQL API

  name                = "pins-cosmos-${local.service_name}-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  access_key_metadata_writes_enabled = true
  enable_automatic_failover          = true
  public_network_access_enabled      = var.database_public_access_enabled
  is_virtual_network_filter_enabled  = false

  # IP addresses to allow access from Azure Portal. See: https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-the-azure-portal
  ip_range_filter = var.database_public_access_enabled ? null : "104.42.195.92,40.76.54.131,52.176.6.30,52.169.50.45,52.187.184.26"

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

resource "azurerm_private_endpoint" "cosmosdb" {
  count = var.database_public_access_enabled ? 0 : 1

  name                = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  subnet_id           = var.cosmosdb_subnet_id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.cosmosdb.id]
  }

  private_service_connection {
    name                           = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
    private_connection_resource_id = azurerm_cosmosdb_account.appeals_database.id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  tags = local.tags
}

import {
  to = azurerm_cosmosdb_mongo_database.appeals_cosmosdb
  id = "/subscriptions/962e477c-0f3b-4372-97fc-a198a58e259e/resourceGroups/pins-rg-appeals-service-dev-ukw-001/providers/Microsoft.DocumentDB/databaseAccounts/pins-cosmos-appeals-service-dev-ukw-001/mongodbDatabases/forms-web-app"
}

resource "azurerm_cosmosdb_mongo_database" "appeals_cosmosdb" {
  name                = "forms-web-app"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  account_name        = azurerm_cosmosdb_account.appeals_database.name
}

import {
  to = azurerm_cosmosdb_mongo_collection.appeals_session_collection
  id = "/subscriptions/962e477c-0f3b-4372-97fc-a198a58e259e/resourceGroups/pins-rg-appeals-service-dev-ukw-001/providers/Microsoft.DocumentDB/databaseAccounts/pins-cosmos-appeals-service-dev-ukw-001/mongodbDatabases/forms-web-app/collections/sessions"
}


resource "azurerm_cosmosdb_mongo_collection" "appeals_session_collection" {
  name                = "sessions"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  account_name        = azurerm_cosmosdb_account.appeals_database.name
  database_name       = azurerm_cosmosdb_mongo_database.appeals_cosmosdb.name

  default_ttl_seconds = "604800" # 1 week

  index {
    keys   = ["_id"]
    unique = true
  }
}