resource "azurerm_mssql_server" "back_office" {
  #checkov:skip=CKV_AZURE_113: Public access enabled for testing
  #checkov:skip=CKV_AZURE_23: Auditing to be added later
  #checkov:skip=CKV_AZURE_24: Auditing to be added later
  name                         = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name          = azurerm_resource_group.back_office_stack.name
  location                     = azurerm_resource_group.back_office_stack.location
  version                      = "12.0"
  administrator_login          = var.sql_server_username
  administrator_login_password = var.sql_server_password
  minimum_tls_version          = "1.2"

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
