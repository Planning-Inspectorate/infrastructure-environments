locals {
  service_name    = "applications-service"
  resource_suffix = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"

  sql_server_username_admin = "pins-sql-${local.service_name}-${local.resource_suffix}-admin-${random_id.username_suffix_admin.id}"
  sql_server_username_app   = "pins-sql-${local.service_name}-${local.resource_suffix}-app-${random_id.username_suffix_app.id}"

  sql_connection_string_admin = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.applications_sql_server.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.applications_sql_db.name}",
      "user=${azurerm_mssql_server.applications_sql_server.administrator_login}",
      "password=${azurerm_mssql_server.applications_sql_server.administrator_login_password}",
      "trustServerCertificate=true"
    ]
  )
  sql_connection_string_app = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.applications_sql_server.fully_qualified_domain_name}",
      "database=${azurerm_mssql_database.applications_sql_db.name}",
      "user=${local.sql_server_username_app}",
      "password=${random_password.applications_sql_server_password_app.result}",
      "trustServerCertificate=true"
    ]
  )

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
