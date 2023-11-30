resource "azurerm_key_vault_access_policy" "read_secrets" {

  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = module.applications_migration_function.principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}

resource "azurerm_role_assignment" "read_data_lake_storage" {
  count = local.synapse_integration_enabled ? 1 : 0

  scope                = data.terraform_remote_state.odw.outputs.data_lake_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_migration_function.principal_id
}
