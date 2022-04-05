resource "azurerm_mssql_server" "common" {
  #checkov:skip=CKV_AZURE_113: Public access enabled for testing
  #checkov:skip=CKV_AZURE_23: Auditing to be added later
  #checkov:skip=CKV_AZURE_24: Auditing to be added later
  name                         = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name          = azurerm_resource_group.common_infrastructure.name
  location                     = azurerm_resource_group.common_infrastructure.location
  version                      = "12.0"
  administrator_login          = var.sql_server_username
  administrator_login_password = var.sql_server_password
  minimum_tls_version          = "1.2"

  tags = var.common_tags
}
