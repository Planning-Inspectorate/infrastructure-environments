resource "azurerm_mssql_server" "applications_sql_server" {
  #checkov:skip=CKV_AZURE_113
  #checkov:skip=CKV_AZURE_23
  #checkov:skip=CKV_AZURE_24
  #checkov:skip=CKV2_AZURE_2: "Ensure that Vulnerability Assessment (VA) is enabled on a SQL server by setting a Storage Account"

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
  #checkov:skip=CKV_AZURE_224: TODO: Ensure that the Ledger feature is enabled on database that requires cryptographic proof and nonrepudiation of data integrity
  #checkov:skip=CKV_AZURE_229: TODO: Ensure the Azure SQL Database Namespace is zone redundant
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

# Metric Alerts
resource "azurerm_monitor_metric_alert" "applications_sql_db_cpu_alert" {
  name                = "${local.service_name} SQL CPU Alert ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [azurerm_mssql_database.applications_sql_db.id]
  description         = "Action will be triggered when cpu percent is greater than 80."
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.action_group_ids.tech
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "applications_sql_db_dtu_alert" {
  name                = "${local.service_name} SQL DTU Alert ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [azurerm_mssql_database.applications_sql_db.id]
  description         = "Action will be triggered when DTU percent is greater than 80."
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "dtu_consumption_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.action_group_ids.tech
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "applications_sql_db_log_io_alert" {
  name                = "${local.service_name} SQL Log IO Alert ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [azurerm_mssql_database.applications_sql_db.id]
  description         = "Action will be triggered when Log write percent is greater than 80."
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "log_write_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.action_group_ids.tech
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "applications_sql_db_deadlock_alert" {
  name                = "${local.service_name} SQL Deadlock Alert ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes              = [azurerm_mssql_database.applications_sql_db.id]
  description         = "Action will be triggered whenever the count of deadlocks is greater than 1."
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "deadlock"
    aggregation      = "Count"
    operator         = "GreaterThanOrEqual"
    threshold        = 1
  }

  action {
    action_group_id = var.action_group_ids.tech
  }

  tags = local.tags
}
