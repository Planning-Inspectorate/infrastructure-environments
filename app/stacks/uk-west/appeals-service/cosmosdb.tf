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
  is_virtual_network_filter_enabled  = false
  #TODO: Private endpoint connection not working so this is enabled for now - Access restrictions done by firewall
  #checkov:skip=CKV_AZURE_99
  #checkov:skip=CKV_AZURE_101
  public_network_access_enabled = true

  # IP addresses to allow access from Azure Portal. See: https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-the-azure-portal
  ip_range_filter = "104.42.195.92,40.76.54.131,52.176.6.30,52.169.50.45,52.187.184.26"

  mongo_server_version = "3.6"

  capabilities {
    name = "DisableRateLimitingResponses"
  }

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

  #  geo_location {
  #    location          = module.azure_region_secondary.location
  #    failover_priority = 1
  #  }

  geo_location {
    location          = module.azure_region_primary.location
    failover_priority = 0
  }

  tags = local.tags
}

resource "azurerm_private_endpoint" "cosmosdb" {
  name                = "pins-pe-${local.service_name}-appeals-db-${local.resource_suffix}"
  location            = azurerm_resource_group.appeals_service_stack.location
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  subnet_id           = var.primary_cosmosdb_subnet_id

  private_dns_zone_group {
    name                 = "cosmosdbprivatednszone"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.cosmosdb.id]
  }

  private_service_connection {
    name                           = "appealsdatabase"
    private_connection_resource_id = azurerm_cosmosdb_account.appeals_database.id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  tags = local.tags
}
