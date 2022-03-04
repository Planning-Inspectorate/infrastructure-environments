resource "azurerm_key_vault" "environment_key_vault" {
  #checkov:skip=CKV_AZURE_42: Soft delete protection enabled by default in latest Azure provider
  #checkov:skip=CKV_AZURE_109: TODO: Network ACL, currently not implemented as it blocks pipeline
  name                        = replace("pinskv${local.service_name}${local.resource_suffix}", "-", "")
  location                    = azurerm_resource_group.common_infrastructure.location
  resource_group_name         = azurerm_resource_group.common_infrastructure.name
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create", "Delete", "Get", "List"
    ]

    secret_permissions = [
      "Delete", "Get", "List", "Set"
    ]

    storage_permissions = [
      "Delete", "Get", "List", "Set"
    ]
  }

  tags = local.tags
}

resource "azurerm_key_vault_secret" "secret" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  for_each = toset(local.secret_names)

  key_vault_id = azurerm_key_vault.environment_key_vault.id
  name         = each.value
  value        = "<enter_value>"

  tags = local.tags

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
