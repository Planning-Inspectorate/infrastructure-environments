locals {
  service_name    = "applications-service"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  # keep the suffix short for training env, as it can only be upto 24 characters total for azurerm_storage_account
  storage_resource_suffix = var.environment == "training" ? "${var.environment}-${module.azure_region_uks.location_short}" : local.resource_suffix
  sql_server_username     = "pins-sql-${local.service_name}-${local.resource_suffix}-admin-${random_id.username_suffix.id}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_uks.location
      ServiceName = local.service_name
    }
  )
}
