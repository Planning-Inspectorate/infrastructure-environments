locals {
  service_name = "back-office"
  # TODO: Let's create database-specific users and passwords instead for connection strings
  # Also, let's store this in Key Vault rather than just spitting it into env variables!
  sql_server_username     = "backofficeadmin_${random_id.username_suffix.id}"
  sql_server_username_app = "backofficeapp_${random_id.username_suffix_app.id}"

  sql_connection_string = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office.name}",
      "user=${azurerm_mssql_server.back_office.administrator_login}",
      "password=${azurerm_mssql_server.back_office.administrator_login_password}",
      "trustServerCertificate=true"
    ]
  )
  sql_connection_string_app = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office.name}",
      "user=${local.sql_server_username_app}",
      "password=${random_password.back_office_sql_server_password_app.result}",
      "trustServerCertificate=true"
    ]
  )

  appeals_sql_connection_string = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office_appeals.name}",
      "user=${azurerm_mssql_server.back_office.administrator_login}",
      "password=${azurerm_mssql_server.back_office.administrator_login_password}",
      "trustServerCertificate=true"
    ]
  )
  appeals_sql_connection_string_app = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.back_office_appeals.name}",
      "user=${local.sql_server_username_app}",
      "password=${random_password.back_office_sql_server_password_app.result}",
      "trustServerCertificate=true"
    ]
  )

  resource_suffix = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
