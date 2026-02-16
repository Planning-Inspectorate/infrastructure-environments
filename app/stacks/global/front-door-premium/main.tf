module "azure_region_ukw" {
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules
  source  = "claranet/regions/azurerm"
  version = "8.0.2"

  azure_region = var.location
}

resource "azurerm_resource_group" "common" {
  count = var.environment == "prod" ? 1 : 0 # only in prod

  name     = "pins-rg-common-prod"
  location = module.azure_region_ukw.location

  tags = local.tags
}

# Shared Front Door instance for production environments
resource "azurerm_cdn_frontdoor_profile" "common" {
  count = var.environment == "prod" ? 1 : 0 # only in prod

  name                = "pins-fd-common-prod"
  resource_group_name = azurerm_resource_group.common[0].name
  sku_name            = "Premium_AzureFrontDoor"

  tags = local.tags
}

# Shared endpoints, one for each service
resource "azurerm_cdn_frontdoor_endpoint" "common" {
  for_each = var.environment == "prod" ? toset(local.services) : [] # only in prod

  name                     = "pins-fde-${each.key}-prod"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.common[0].id

  tags = local.tags
}

#front door monitoring log analytics
resource "azurerm_log_analytics_workspace" "common" {
  count               = var.environment == "prod" ? 1 : 0 # only in prod
  name                = "pins-log-common-prod"
  location            = module.azure_region_ukw.location
  resource_group_name = azurerm_resource_group.common[0].name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  daily_quota_gb      = var.log_daily_cap_gb

  tags = local.tags
}

#front door monitoring - diagnostic setting
resource "azurerm_monitor_diagnostic_setting" "web_front_door" {
  count                      = var.environment == "prod" ? 1 : 0 # only in prod
  name                       = "pins-fd-mds-common-prod"
  target_resource_id         = azurerm_cdn_frontdoor_profile.common[0].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.common[0].id

  enabled_log {
    category = "FrontdoorWebApplicationFirewallLog"
  }

  metric {
    category = "AllMetrics"
  }

  lifecycle {
    ignore_changes = [
      enabled_log,
      metric
    ]
  }
}

# Log cap alert using scheduled query rules
resource "azurerm_monitor_scheduled_query_rules_alert_v2" "log_cap" {
  count = var.environment == "prod" ? 1 : 0

  name         = "Log cap Alert"
  display_name = "log Daily data limit reached"
  description  = "Triggered when the log Data cap is reached."

  location            = module.azure_region_ukw.location
  resource_group_name = azurerm_resource_group.common[0].name
  scopes              = [azurerm_log_analytics_workspace.common[0].id]

  enabled                 = true
  auto_mitigation_enabled = false

  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"

  criteria {
    query                   = <<-QUERY
      _LogOperation
      | where Category =~ "Ingestion" | where Detail contains "OverQuota"
      QUERY
    time_aggregation_method = "Count"
    threshold               = 0
    operator                = "GreaterThan"
  }

  severity = 2
  action {
    action_groups = [data.azurerm_monitor_action_group.devops_action_group[0].id]
  }
}
