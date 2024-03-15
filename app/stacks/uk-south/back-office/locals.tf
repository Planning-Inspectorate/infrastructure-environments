locals {
  service_name = "back-office"
  # TODO: 'back_office_sql_database' is an ID, not a name - this won't work surely?

  # Variable is currently unused in UKS so is commented out. However, once we start provisioning UKS resources, this will need to be reintroduced and passed to a UKS based key vault secret
  # sql_connection_string         = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${var.back_office_sql_database};user=${azurerm_mssql_server.back_office.administrator_login};password=${urlencode(azurerm_mssql_server.back_office.administrator_login_password)};trustServerCertificate=true"
  appeals_sql_connection_string = "sqlserver://${azurerm_mssql_server.back_office.fully_qualified_domain_name};database=${var.back_office_appeals_sql_database};user=${azurerm_mssql_server.back_office.administrator_login};password=${urlencode(azurerm_mssql_server.back_office.administrator_login_password)};trustServerCertificate=true"
  resource_suffix               = "${var.environment}-${module.azure_region_uks.location_short}-${var.instance}"

  tags = merge(
    var.common_tags,
    {
      Region      = module.azure_region_uks.location
      ServiceName = local.service_name
    }
  )

  bo_appeals_tech_emails      = [for rec in data.azurerm_monitor_action_group.bo_appeals_tech.email_receiver : rec.email_address]
  bo_applications_tech_emails = [for rec in data.azurerm_monitor_action_group.bo_applications_tech.email_receiver : rec.email_address]
  tech_emails                 = concat(local.bo_appeals_tech_emails, local.bo_applications_tech_emails)
}
