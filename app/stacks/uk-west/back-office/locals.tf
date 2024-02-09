locals {
  service_name = "back-office"
  # TODO: Let's create database-specific users and passwords instead for connection strings
  # Also, let's store this in Key Vault rather than just spitting it into env variables!
  sql_connection_string_admin = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office.name}",
      "user=${azurerm_mssql_server.back_office.administrator_login}",
      "password=${azurerm_mssql_server.back_office.administrator_login_password}",
      "trustServerCertificate=true"
    ]
  )
  appeals_sql_connection_string = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${azurerm_mssql_database.back_office_appeals.name};user=${azurerm_mssql_server.back_office.administrator_login};password=${azurerm_mssql_server.back_office.administrator_login_password};trustServerCertificate=true"
  sql_server_username_admin     = "backofficeadmin_${random_id.username_suffix_admin.id}"
  resource_suffix               = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
