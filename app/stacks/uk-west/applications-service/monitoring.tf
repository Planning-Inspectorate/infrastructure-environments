resource "azurerm_log_analytics_workspace" "applications_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
  daily_quota_gb      = var.log_daily_cap_gb

  tags = local.tags
}

resource "azurerm_application_insights" "applications_app_insights" {
  name                = "pins-ai-${local.service_name}-${local.resource_suffix}-app-insights"
  location            = azurerm_resource_group.applications_service_stack.location
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  workspace_id        = azurerm_log_analytics_workspace.applications_service.id
  application_type    = "web"
}

# availability test for the portal app
resource "azurerm_application_insights_standard_web_test" "portal" {
  count = var.monitoring_config.app_insights_web_test_enabled ? 1 : 0

  name                    = "${local.service_name}-ai-swt-${local.resource_suffix}"
  resource_group_name     = azurerm_resource_group.applications_service_stack.name
  location                = azurerm_resource_group.applications_service_stack.location
  application_insights_id = azurerm_application_insights.applications_app_insights.id
  geo_locations = [
    "emea-se-sto-edge", # UK West
    "emea-ru-msa-edge", # UK South
    "emea-gb-db3-azr",  # North Europe
    "emea-nl-ams-azr"   # West Europe
  ]
  retry_enabled = true
  enabled       = true

  request {
    url = "https://${var.applications_service_public_url}/project-search"
  }

  validation_rules {
    ssl_check_enabled           = true
    ssl_cert_remaining_lifetime = 7
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "web_availability" {
  count = var.monitoring_config.app_insights_web_test_enabled ? 1 : 0

  name                = "Web Availablity - ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes = [
    azurerm_application_insights_standard_web_test.portal[0].id,
    azurerm_application_insights.applications_app_insights.id
  ]
  description = "Metric alert for standard web test (availability) for the portal app - which also checks the certificate"

  application_insights_web_test_location_availability_criteria {
    web_test_id           = azurerm_application_insights_standard_web_test.portal[0].id
    component_id          = azurerm_application_insights.applications_app_insights.id
    failed_location_count = 1
  }

  action {
    action_group_id = var.action_group_ids.tech
  }
  action {
    action_group_id = var.action_group_ids.service_manager
  }
  action {
    action_group_id = var.action_group_ids.its
  }
}

resource "azurerm_storage_container" "sql_server" {
  #TODO: Logging
  #checkov:skip=CKV2_AZURE_21 Logging not implemented yet
  name                  = "sqlvulnerabilityassessment"
  storage_account_id    = azurerm_storage_account.applications_sql_server.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "applications_sql_server_storage" {
  scope                = azurerm_storage_account.applications_sql_server.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.applications_sql_server.identity[0].principal_id
}

resource "azurerm_advanced_threat_protection" "applications_sql_server_storage" {
  target_resource_id = azurerm_storage_account.applications_sql_server.id
  enabled            = var.monitoring_alerts_enabled
}

# auditing policy
resource "azurerm_mssql_server_extended_auditing_policy" "applications_sql_server" {
  enabled                    = var.monitoring_alerts_enabled
  storage_endpoint           = azurerm_storage_account.applications_sql_server.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.applications_sql_server.primary_access_key
  server_id                  = azurerm_mssql_server.applications_sql_server.id
  retention_in_days          = var.sql_database_configuration["audit_retention_days"]
  log_monitoring_enabled     = false

  depends_on = [
    azurerm_role_assignment.applications_sql_server_storage,
    azurerm_storage_account.applications_sql_server,
  ]
}

# security alerts
resource "azurerm_mssql_server_security_alert_policy" "applications_sql_server" {
  state                      = var.monitoring_alerts_enabled ? "Enabled" : "Disabled"
  resource_group_name        = azurerm_resource_group.applications_service_stack.name
  server_name                = azurerm_mssql_server.applications_sql_server.name
  storage_endpoint           = azurerm_storage_account.applications_sql_server.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.applications_sql_server.primary_access_key
  retention_days             = var.sql_database_configuration["audit_retention_days"]
  email_account_admins       = true
  email_addresses            = local.tech_emails
}

# vulnerabilty assesment
resource "azurerm_mssql_server_vulnerability_assessment" "applications_sql_server" {
  count = var.monitoring_alerts_enabled ? 1 : 0

  #checkov:skip=CKV2_AZURE_3: scans enabled by env
  #checkov:skip=CKV2_AZURE_4: false positive?
  #checkov:skip=CKV2_AZURE_5: false positive?
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.applications_sql_server.id
  storage_container_path          = "${azurerm_storage_account.applications_sql_server.primary_blob_endpoint}${azurerm_storage_container.sql_server.name}/"
  storage_account_access_key      = azurerm_storage_account.applications_sql_server.primary_access_key

  recurring_scans {
    enabled                   = var.monitoring_alerts_enabled
    email_subscription_admins = true
    emails                    = local.tech_emails
  }
}