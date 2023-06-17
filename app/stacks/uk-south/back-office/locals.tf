locals {
  service_name = "back-office"
  # TODO: 'back_office_sql_database' is an ID, not a name - this won't work surely?
  sql_connection_string         = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${var.back_office_sql_database};user=${azurerm_mssql_server.back_office.administrator_login};password=${urlencode(azurerm_mssql_server.back_office.administrator_login_password)};trustServerCertificate=true"
  appeals_sql_connection_string = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${var.back_office_appeals_sql_database};user=${azurerm_mssql_server.back_office.administrator_login};password=${urlencode(azurerm_mssql_server.back_office.administrator_login_password)};trustServerCertificate=true"
  resource_suffix               = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_uks.location
      ServiceName = local.service_name
    }
  )
}
