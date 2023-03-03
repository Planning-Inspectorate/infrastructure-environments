locals {
  service_name          = "applications-service"
  resource_suffix       = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"
  sql_server_username   = "pins-sql-${local.service_name}-${local.resource_suffix}-admin-${random_id.username_suffix.id}"
  sql_connection_string = "sqlserver://${azurerm_mssql_server.applications_sql_server.fully_qualified_domain_name};database=${azurerm_mssql_database.applications_sql_db.name};user=${azurerm_mssql_server.applications_sql_server.administrator_login};password=${azurerm_mssql_server.applications_sql_server.administrator_login_password};trustServerCertificate=true"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
