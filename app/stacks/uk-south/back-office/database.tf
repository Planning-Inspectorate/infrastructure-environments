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

  tags = var.common_tags
}

resource "azurerm_mssql_failover_group" "back_office" {
  name      = "pins-sqlag-${local.service_name}-${local.resource_suffix}"
  server_id = var.primary_sql_server_id
  databases = [var.back_office_sql_database]

  partner_server {
    id = azurerm_mssql_server.back_office.id
  }

  read_write_endpoint_failover_policy {
    mode = "Manual"
  }

  tags = var.common_tags
}
