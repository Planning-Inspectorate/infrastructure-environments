locals {
  custom_hostname_certificate_secret_id = "${var.key_vault_uri}secrets/pins-wildcard/6a3852ed12ad4960a9efa220f13106b9"
  service_name                          = "back-office"
  sql_connection_string                 = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${azurerm_mssql_database.back_office.name};user=${azurerm_mssql_server.back_office.administrator_login};password=${azurerm_mssql_server.back_office.administrator_login_password};trustServerCertificate=true"
  sql_server_username                   = "backofficeadmin_${random_id.username_suffix.id}"
  resource_suffix                       = "${var.environment}-${module.azure_region_ukw.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_ukw.location
      ServiceName = local.service_name
    }
  )
}
