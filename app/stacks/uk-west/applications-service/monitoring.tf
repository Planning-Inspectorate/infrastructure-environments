resource "azurerm_log_analytics_workspace" "applications_service" {
  name                = "pins-log-${local.service_name}-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  location            = azurerm_resource_group.applications_service_stack.location
  sku                 = "PerGB2018"
  retention_in_days   = 30

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
  enabled       = var.environment == "prod" || var.environment == "training"

  request {
    url = "https://applications-service-${var.environment}.planninginspectorate.gov.uk/project-search"
  }
  validation_rules {
    ssl_check_enabled           = true
    ssl_cert_remaining_lifetime = 7
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "portal_availability" {
  count = var.monitoring_config.app_insights_web_test_enabled ? 1 : 0

  name                = "Web Availablity - ${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.applications_service_stack.name
  scopes = [
    azurerm_application_insights_standard_web_test.portal[0].id,
    azurerm_application_insights.web_app_insights.id
  ]
  description = "Metric alert for standard web test (availability) for the portal app - which also checks the certificate"

  application_insights_web_test_location_availability_criteria {
    web_test_id           = azurerm_application_insights_standard_web_test.portal[0].id
    component_id          = azurerm_application_insights.applications_app_insights.id
    failed_location_count = 1
  }

  action {
    action_group_id = [
      var.action_group_ids.tech,
      var.action_group_ids.service_manager,
      var.action_group_ids.its
    ]
  }
}
