# Dependant on UK South and UK West SQL Servers

resource "azurerm_mssql_database" "back_office" {
  name         = "pins-sqldb-${local.service_name}-${local.resource_suffix}"
  server_id    = var.sql_server_primary_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = var.database_size["sku_name"]
  max_size_gb  = var.database_size["max_size_gb"]

  tags = var.common_tags
}

resource "azurerm_mssql_failover_group" "back_office" {
  name      = "pins-sqlag-${local.service_name}-${local.resource_suffix}"
  server_id = var.sql_server_primary_id
  databases = [azurerm_mssql_database.back_office.id]

  partner_server {
    id = var.sql_server_failover_id
  }

  read_write_endpoint_failover_policy {
    mode = "Manual"
  }

  tags = var.common_tags
}
