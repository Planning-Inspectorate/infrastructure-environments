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

  certificate_permissions = [
    "Create", "Delete", "Get", "List", "Update", "Recover"
  ]

  key_permissions = [
    "Create", "Delete", "Get", "List", "Purge", "Recover"
  ]

  secret_permissions = [
    "Delete", "Get", "List", "Set", "Purge", "Recover"
  ]

  storage_permissions = [
    "Delete", "Get", "List", "Set", "Purge", "Recover"
  ]
}

resource "azurerm_key_vault_access_policy" "admins" {
  key_vault_id = azurerm_key_vault.environment_key_vault.id
  object_id    = "6e0b1ad0-76db-4871-b8d8-9d7b539527ff" # "PINS ODT Key Vault Admins"
  tenant_id    = data.azurerm_client_config.current.tenant_id

  certificate_permissions = [
    "Create", "Get", "List"
  ]

  key_permissions = [
    "Create", "Get", "List"
  ]

  secret_permissions = [
    "Get", "List", "Set"
  ]

  storage_permissions = [
    "Get", "List", "Set"
  ]
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

resource "azurerm_key_vault_secret" "secret" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  for_each = toset(local.secret_names)

  key_vault_id = azurerm_key_vault.environment_key_vault.id
  name         = each.value
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

resource "azurerm_key_vault_certificate" "pins_wildcard" {
  name         = "pins-wildcard"
  key_vault_id = azurerm_key_vault.environment_key_vault.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      extended_key_usage = [
        "1.3.6.1.5.5.7.3.1",
        "1.3.6.1.5.5.7.3.2"
      ]

      key_usage = [
        "dataEncipherment",
        "digitalSignature"
      ]

      subject            = "CN=*.planninginspectorate.gov.uk"
      validity_in_months = 12
    }
  }

  tags = local.tags

  depends_on = [
    azurerm_key_vault_access_policy.terraform
  ]

  lifecycle {
    ignore_changes = [
      certificate,
      version
    ]
  }
}
