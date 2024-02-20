resource "azurerm_mssql_server" "applications_sql_server" {
  #checkov:skip=CKV_AZURE_113
  #checkov:skip=CKV_AZURE_23
  #checkov:skip=CKV_AZURE_24

  name                          = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.applications_service_stack.name
  location                      = azurerm_resource_group.applications_service_stack.location
  version                       = "12.0"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.database_public_access_enabled

  administrator_login          = local.sql_server_username
  administrator_login_password = random_password.applications_sql_server_password.result

  azuread_administrator {
    login_username = var.sql_server_azuread_administrator["login_username"]
    object_id      = var.sql_server_azuread_administrator["object_id"]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

resource "azurerm_mssql_database" "applications_sql_db" {
  name        = "pins-sqldb-${local.service_name}-${local.resource_suffix}"
  server_id   = azurerm_mssql_server.applications_sql_server.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name    = var.sql_database_configuration["sku_name"]
  max_size_gb = var.sql_database_configuration["max_size_gb"]

  short_term_retention_policy {
    retention_days = var.sql_database_configuration["short_term_retention_days"]
  }

  tags = local.tags
}

resource "azurerm_private_endpoint" "applications_sql_server" {
  name                = "pins-sqldb-private-endpoint-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  subnet_id           = azurerm_subnet.applications_service_ingress.id

  private_dns_zone_group {
    name                 = "sqlserverprivatednszone"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.database.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_mssql_server.applications_sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "random_password" "applications_sql_server_password" {
  length           = 32
  special          = true
  override_special = "#&-_+"
}

resource "random_id" "username_suffix" {
  byte_length = 6
}

resource "random_password" "applications_sql_server_password_app" {
  length           = 32
  special          = true
  override_special = "#&-_+"
}

resource "random_id" "username_suffix_app" {
  byte_length = 6
}
