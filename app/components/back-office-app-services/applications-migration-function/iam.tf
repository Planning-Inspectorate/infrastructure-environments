resource "azurerm_key_vault_access_policy" "read_secrets" {

  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.applications_migration_function.principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}
