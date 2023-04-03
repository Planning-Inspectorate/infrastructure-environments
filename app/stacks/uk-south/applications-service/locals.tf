locals {
  service_name        = "applications-service"
  resource_suffix     = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"
  sql_server_username = "pins-sql-${local.service_name}-${local.resource_suffix}-admin-${random_id.username_suffix.id}"
  sql_connection_string = join(
    ";",
    [
      "Server=tcp:${azurerm_mssql_server.applications_sql_server.fully_qualified_domain_name},1433",
      "Initial Catalog=${azurerm_mssql_database.applications_sql_db.name}",
      "User ID=${azurerm_mssql_server.applications_sql_server.administrator_login}",
      "Password=${azurerm_mssql_server.applications_sql_server.administrator_login_password}",
      "Encrypt=True",
      "TrustServerCertificate=False",
      "Connection Timeout=30"
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
