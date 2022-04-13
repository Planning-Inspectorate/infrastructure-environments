resource "random_password" "back_office_sql_server_password" {
  length           = 32
  special          = true
  override_special = "#$&-_+"
  min_lower        = 2
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
}

resource "random_id" "username_suffix" {
  byte_length = 6
}

resource "azurerm_key_vault_secret" "back_office_sql_server_password" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-server-password"
  value        = azurerm_mssql_server.back_office.administrator_login_password

  tags = local.tags
}

resource "azurerm_key_vault_secret" "back_office_sql_server_username" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-server-username"
  value        = azurerm_mssql_server.back_office.administrator_login

  tags = local.tags
}

resource "azurerm_key_vault_secret" "back_office_sql_connection_string" {
  #checkov:skip=CKV_AZURE_41: TODO: Secret rotation
  content_type = "text/plain"
  key_vault_id = var.key_vault_id
  name         = "back-office-sql-connection-string"
  value        = local.sql_connection_string

  tags = local.tags
}

resource "azurerm_mssql_server" "back_office" {
  #checkov:skip=CKV_AZURE_113: Public access enabled for testing
  #checkov:skip=CKV_AZURE_23: Auditing to be added later
  #checkov:skip=CKV_AZURE_24: Auditing to be added later
  name                         = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name          = azurerm_resource_group.back_office_stack.name
  location                     = azurerm_resource_group.back_office_stack.location
  version                      = "12.0"
  administrator_login          = local.sql_server_username
  administrator_login_password = random_password.back_office_sql_server_password.result
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = var.sql_server_azuread_administrator["login_username"]
    object_id      = var.sql_server_azuread_administrator["object_id"]
  }

  tags = local.tags
}

resource "azurerm_private_endpoint" "back_office_sql_server" {
  name                = "pins-pe-${local.service_name}-sql-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.back_office_stack.name
  location            = azurerm_resource_group.back_office_stack.location
  subnet_id           = azurerm_subnet.back_office_ingress.id

  private_dns_zone_group {
    name                 = "sqlserverprivatednszone"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.database.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_mssql_server.back_office.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "azurerm_mssql_database" "back_office" {
  name        = "pins-sqldb-${local.service_name}-${local.resource_suffix}"
  server_id   = azurerm_mssql_server.back_office.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name    = var.sql_database_configuration["sku_name"]
  max_size_gb = var.sql_database_configuration["max_size_gb"]

  short_term_retention_policy {
    retention_days = var.sql_database_configuration["short_term_retention_days"]
  }

  tags = local.tags
}
