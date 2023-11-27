locals {
  service_name    = "appeals-service"
  resource_suffix = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"

  sql_connection_string_admin = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.appeals_sql_server.fully_qualified_domain_name}",
      "database=${var.primary_appeals_sql_database_name}",
      "user=${azurerm_mssql_server.appeals_sql_server.administrator_login}",
      "password=${azurerm_mssql_server.appeals_sql_server.administrator_login_password}",
      "trustServerCertificate=false",
      "encrypt=true"
    ]
  )
  sql_connection_string_app = join(
    ";",
    [
      "sqlserver://${azurerm_mssql_server.appeals_sql_server.fully_qualified_domain_name}",
      "database=${var.primary_appeals_sql_database_name}",
      "user=${var.sql_server_username_app}",
      "password=${var.sql_server_password_app}",
      "trustServerCertificate=false",
      "encrypt=true"
    ]
  )

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_uks.location
      ServiceName = local.service_name
    }
  )
}
