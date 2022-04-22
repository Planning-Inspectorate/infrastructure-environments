resource "azurerm_mssql_server" "back_office" {
  #checkov:skip=CKV_AZURE_113: Public access enabled for testing
  #checkov:skip=CKV_AZURE_23: Auditing to be added later
  #checkov:skip=CKV_AZURE_24: Auditing to be added later
  name                          = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.back_office_stack.name
  location                      = azurerm_resource_group.back_office_stack.location
  version                       = "12.0"
  administrator_login           = var.sql_server_username
  administrator_login_password  = var.sql_server_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.database_public_access_enabled

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

resource "azurerm_mssql_failover_group" "back_office" {
  name      = "pins-sqlag-${local.service_name}-${local.resource_suffix}"
  server_id = var.primary_sql_server_id
  databases = [var.back_office_sql_database]

  partner_server {
    id = azurerm_mssql_server.back_office.id
  }

  read_write_endpoint_failover_policy {
    mode = "Manual"
  }

  tags = local.tags
}
