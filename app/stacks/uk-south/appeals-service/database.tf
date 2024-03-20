resource "azurerm_mssql_server" "appeals_sql_server" {
  #checkov:skip=CKV_AZURE_113: public network access controlled by env

  name                          = "pins-sql-${local.service_name}-${local.resource_suffix}"
  resource_group_name           = azurerm_resource_group.appeals_service_stack.name
  location                      = azurerm_resource_group.appeals_service_stack.location
  version                       = "12.0"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.database_public_access_enabled

  administrator_login          = var.sql_server_username_admin
  administrator_login_password = var.sql_server_password_admin

  azuread_administrator {
    login_username = var.sql_server_azuread_administrator["login_username"]
    object_id      = var.sql_server_azuread_administrator["object_id"]
  }

  identity {
    type = "SystemAssigned"
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

resource "azurerm_mssql_failover_group" "appeals_sql_server_failover_group" {
  name      = "pins-sqldb-fog-${local.service_name}-${local.resource_suffix}"
  server_id = var.primary_appeals_sql_server_id
  databases = [var.primary_appeals_sql_database_id]

  partner_server {
    id = azurerm_mssql_server.appeals_sql_server.id
  }

  read_write_endpoint_failover_policy {
    mode = "Manual"
    # mode          = "Automatic"
    # grace_minutes = 60
  }

  tags = local.tags
}

# Monitoring and Alerting

# storage for auditing
resource "azurerm_storage_account" "appeals_sql_server" {
  #TODO: Customer Managed Keys
  #checkov:skip=CKV2_AZURE_1: Customer Managed Keys not implemented yet
  #checkov:skip=CKV2_AZURE_18: Customer Managed Keys not implemented yet
  #TODO: Logging
  #checkov:skip=CKV_AZURE_33: Not using queues, could implement example commented out
  #checkov:skip=CKV2_AZURE_21: Logging not implemented yet
  #TODO: Access restrictions
  #checkov:skip=CKV_AZURE_35: Network access restrictions
  #checkov:skip=CKV_AZURE_59: TODO: Ensure that Storage accounts disallow public access
  name                             = replace("pinsstsql${local.resource_suffix}", "-", "")
  resource_group_name              = azurerm_resource_group.appeals_service_stack.name
  location                         = azurerm_resource_group.appeals_service_stack.location
  account_tier                     = "Standard"
  account_replication_type         = "GRS"
  min_tls_version                  = "TLS1_2"
  enable_https_traffic_only        = true
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  # network_rules {
  #   default_action             = "Deny"
  #   ip_rules                   = ["127.0.0.1"]
  #   virtual_network_subnet_ids = [azurerm_subnet.appeals_service_ingress.id]
  #   bypass                     = ["AzureServices"]
  # }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags

  # queue_properties  {
  #   logging {
  #     delete                = true
  #     read                  = true
  #     write                 = true
  #     version               = "2.0"
  #     retention_policy_days = 7
  #   }
  #   hour_metrics {
  #     enabled               = true
  #     include_apis          = true
  #     version               = "2.0"
  #     retention_policy_days = 7
  #   }
  # }
}

resource "azurerm_storage_container" "appeals_sql_server" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "sqlvulnerabilityassessment"
  storage_account_name  = azurerm_storage_account.appeals_sql_server.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "appeals_sql_server" {
  scope                = azurerm_storage_account.appeals_sql_server.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.appeals_sql_server.identity[0].principal_id
}

# auditing policy
resource "azurerm_mssql_server_extended_auditing_policy" "appeals_sql_server" {
  enabled                    = var.monitoring_alerts_enabled
  storage_endpoint           = azurerm_storage_account.appeals_sql_server.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.appeals_sql_server.primary_access_key
  server_id                  = azurerm_mssql_server.appeals_sql_server.id
  retention_in_days          = var.sql_database_configuration["audit_retention_days"]
  log_monitoring_enabled     = false

  depends_on = [
    azurerm_role_assignment.appeals_sql_server,
    azurerm_storage_account.appeals_sql_server,
  ]
}

# security alerts
resource "azurerm_mssql_server_security_alert_policy" "appeals_sql_server" {
  state                      = var.monitoring_alerts_enabled ? "Enabled" : "Disabled"
  resource_group_name        = azurerm_resource_group.appeals_service_stack.name
  server_name                = azurerm_mssql_server.appeals_sql_server.name
  storage_endpoint           = azurerm_storage_account.appeals_sql_server.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.appeals_sql_server.primary_access_key
  retention_days             = var.sql_database_configuration["audit_retention_days"]
  email_account_admins       = true
  email_addresses            = local.tech_emails
}

# vulnerabilty assesment
resource "azurerm_mssql_server_vulnerability_assessment" "appeals_sql_server" {
  #checkov:skip=CKV2_AZURE_3: scans enabled by env
  #checkov:skip=CKV2_AZURE_4: false positive?
  #checkov:skip=CKV2_AZURE_5: false positive?
  count                           = var.monitoring_alerts_enabled ? 1 : 0
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.appeals_sql_server.id
  storage_container_path          = "${azurerm_storage_account.appeals_sql_server.primary_blob_endpoint}${azurerm_storage_container.appeals_sql_server.name}/"
  storage_account_access_key      = azurerm_storage_account.appeals_sql_server.primary_access_key

  recurring_scans {
    enabled                   = var.monitoring_alerts_enabled
    email_subscription_admins = true
    emails                    = local.tech_emails
  }
}
