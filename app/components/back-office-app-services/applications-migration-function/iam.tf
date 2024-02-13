# also requires granting db_datareader role on the database directly
resource "azurerm_role_assignment" "read_data_lake_storage" {
  count = var.odw_synapse_integration_enabled ? 1 : 0

  scope                = var.odw_data_lake_storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_migration_function.principal_id
}
