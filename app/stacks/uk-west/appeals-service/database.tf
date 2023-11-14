resource "azurerm_mssql_server" "appeals_sql_server" {
  #checkov:skip=CKV_AZURE_113
  #checkov:skip=CKV_AZURE_23
  #checkov:skip=CKV_AZURE_24

  name                          = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.appeals_service_stack.name
  location                      = azurerm_resource_group.appeals_service_stack.location
  version                       = "12.0"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.database_public_access_enabled

  administrator_login          = local.sql_server_username_admin
  administrator_login_password = random_password.appeals_sql_server_password_admin.result

  azuread_administrator {
    login_username = var.sql_server_azuread_administrator["login_username"]
    object_id      = var.sql_server_azuread_administrator["object_id"]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

resource "azurerm_mssql_database" "appeals_sql_db" {
  name        = "pins-sqldb-${local.service_name}-${local.resource_suffix}"
  server_id   = azurerm_mssql_server.appeals_sql_server.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name    = var.sql_database_configuration["sku_name"]
  max_size_gb = var.sql_database_configuration["max_size_gb"]

  short_term_retention_policy {
    retention_days = var.sql_database_configuration["short_term_retention_days"]
  }

  long_term_retention_policy {
    weekly_retention  = var.sql_database_configuration["long_term_retention_weekly"]
    monthly_retention = var.sql_database_configuration["long_term_retention_monthly"]
    yearly_retention  = var.sql_database_configuration["long_term_retention_yearly"]
    week_of_year      = var.sql_database_configuration["long_term_week_of_year"]
  }

  tags = local.tags
}

resource "azurerm_private_endpoint" "appeals_sql_server" {
  name                = "pins-sqldb-private-endpoint-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.appeals_service_stack.name
  location            = azurerm_resource_group.appeals_service_stack.location
  subnet_id           = azurerm_subnet.appeals_service_ingress.id

  private_dns_zone_group {
    name                 = "sqlserverprivatednszone"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.database.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_mssql_server.appeals_sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "random_password" "appeals_sql_server_password_admin" {
  length           = 32
  special          = true
  override_special = "#&-_+"
  min_lower        = 2
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
}

resource "random_id" "username_suffix_admin" {
  byte_length = 6
}

resource "random_password" "appeals_sql_server_password_app" {
  length           = 32
  special          = true
  override_special = "#&-_+"
  min_lower        = 2
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
}

resource "random_id" "username_suffix_app" {
  byte_length = 6
}
