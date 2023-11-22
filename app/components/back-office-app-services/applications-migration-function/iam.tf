resource "azurerm_key_vault_access_policy" "read_secrets" {

  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = module.applications_migration_function.principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}

# Read permissions for Synapse Storage Account curated_db container
data "azurerm_storage_account" "odw_data_lake_storage_account" {
  provider            = azurerm.odw
  resource_group_name = var.odw_resource_group_name
  name                = var.odw_data_lake_storage_account_name
}

# Annoyingly it doesn't look like you can get a data "azurerm_storage_container" resource in a different Subscription and RG
# So we can get the storage account identifier and add on the container manually.
resource "azurerm_role_assignment" "read_data_lake_storage" {
  scope                = "/${data.azurerm_storage_account.odw_data_lake_storage_account.id}/blobServices/default/containers/odw_curated"
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_migration_function.principal_id
}

# TODO: For now, database-level access (i.e. the db_datareader role) will be added manually via Synapse Studio
