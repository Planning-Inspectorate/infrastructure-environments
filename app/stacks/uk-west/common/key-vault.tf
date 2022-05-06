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

  tags = local.tags
}

resource "azurerm_key_vault_access_policy" "terraform" {
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  object_id    = data.azurerm_client_config.current.object_id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  certificate_permissions = ["Create", "Delete", "Get", "Import", "List", "Purge", "Recover", "Update"]
  key_permissions         = ["Create", "Delete", "Get", "List", "Purge", "Recover"]
  secret_permissions      = ["Delete", "Get", "List", "Set", "Purge", "Recover"]
  storage_permissions     = ["Delete", "Get", "List", "Set", "Purge", "Recover"]
}

resource "azurerm_key_vault_access_policy" "admins" {
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  object_id    = "6e0b1ad0-76db-4871-b8d8-9d7b539527ff" # "PINS ODT Key Vault Admins"
  tenant_id    = data.azurerm_client_config.current.tenant_id

  certificate_permissions = ["Create", "Delete", "Get", "Import", "List", "Purge", "Recover", "Update"]
  key_permissions         = ["Create", "Delete", "Get", "List", "Purge", "Recover"]
  secret_permissions      = ["Delete", "Get", "List", "Set", "Purge", "Recover"]
  storage_permissions     = ["Delete", "Get", "List", "Set", "Purge", "Recover"]
}

resource "azurerm_key_vault_access_policy" "app_service" {
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  object_id    = var.app_service_principal_id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  certificate_permissions = ["Get"]
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}

resource "azurerm_key_vault_access_policy" "frontdoor" {
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  object_id    = var.front_door_principal_id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  certificate_permissions = ["Get"]
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}

resource "azurerm_key_vault_secret" "applications_service_vpn_gateway_shared_key" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  name         = "applications-service-vpn-gateway-shared-key"
  value        = "<enter_value>"

  tags = local.tags

  depends_on = [
    azurerm_key_vault_access_policy.terraform
  ]

  lifecycle {
    ignore_changes = [
      value,
      version
    ]
  }
}
