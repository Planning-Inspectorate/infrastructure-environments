resource "azurerm_key_vault_access_policy" "read_secrets" {

  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = module.applications_migration_function.principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}

# Annoyingly it doesn't look like you can get a data "azurerm_storage_container" resource in a different Subscription and RG
# So we need to build the resource ID dynamically
resource "azurerm_role_assignment" "read_data_lake_storage" {
  # We're only deploying the synapse migration functionality on Dev right now
  count = var.odw_subscription_id != "" ? 1 : 0

  scope                = join("/", "/subscriptions", var.odw_subscription_id, "resourceGroups", var.odw_resource_group_name, "providers/Microsoft.Storage/storageAccounts", var.odw_data_lake_storage_account_name, "blobServices/default/containers/odw_curated")
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_migration_function.principal_id
}

# TODO: For now, database-level access (i.e. the db_datareader role) will be added manually via Synapse Studio
