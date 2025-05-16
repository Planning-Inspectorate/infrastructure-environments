module "azure_region_ukw" {
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
