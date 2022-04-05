resource "random_password" "back_office_sql_server_password" {
  length      = 32
  special     = true
  min_lower   = 2
  min_upper   = 2
  min_numeric = 2
  min_special = 2
}

resource "random_id" "username_suffix" {
  byte_length = 6
}

# tflint-ignore: terraform_unused_declarations
resource "azurerm_key_vault_secret" "back_office_sql_server_password" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-server-password"
  value        = random_password.back_office_sql_server_password.result

  tags = local.tags

  lifecycle {
    ignore_changes = [
      value,
      version
    ]
  }
}

# tflint-ignore: terraform_unused_declarations
resource "azurerm_key_vault_secret" "back_office_sql_server_username" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  #checkov:skip=CKV_AZURE_114: No need to set content type via Terraform, as secrets to be updated in Portal
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-server-username"
  value        = "backofficeadmin_${random_id.username_suffix.id}"

  tags = local.tags

  lifecycle {
    ignore_changes = [
      value,
      version
    ]
  }
}

resource "azurerm_mssql_server" "back_office" {
  #checkov:skip=CKV_AZURE_113: Public access enabled for testing
  #checkov:skip=CKV_AZURE_23: Auditing to be added later
  #checkov:skip=CKV_AZURE_24: Auditing to be added later
  name                         = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name          = azurerm_resource_group.back_office_stack.name
  location                     = azurerm_resource_group.back_office_stack.location
  version                      = "12.0"
  administrator_login          = "backofficeadmin_${random_id.username_suffix.id}"
  administrator_login_password = random_password.back_office_sql_server_password.result
  minimum_tls_version          = "1.2"

  depends_on = [
    azurerm_key_vault_secret.back_office_sql_server_username,
    azurerm_key_vault_secret.back_office_sql_server_password
  ]

  tags = local.tags
}

resource "azurerm_mssql_database" "back_office" {
  name         = "pins-sqldb-${local.service_name}-${local.resource_suffix}"
  server_id    = azurerm_mssql_server.back_office.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = var.database_size["sku_name"]
  max_size_gb  = var.database_size["max_size_gb"]

  tags = local.tags
}
