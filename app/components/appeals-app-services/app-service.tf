module "app_service" {
  for_each = local.app_services

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-app-service?ref=1.3"

  action_group_low_id             = var.action_group_low_id
  app_name                        = each.value["app_name"]
  app_service_plan_id             = var.app_service_plan_id
  app_service_private_dns_zone_id = can(each.value["app_service_private_dns_zone_id"]) ? each.value["app_service_private_dns_zone_id"] : null
  app_settings                    = each.value["app_settings"]
  container_registry_name         = var.container_registry_name
  container_registry_rg           = var.container_registry_rg
  endpoint_subnet_id              = can(each.value["endpoint_subnet_id"]) ? each.value["endpoint_subnet_id"] : null
  front_door_restriction          = can(each.value["front_door_restriction"]) ? each.value["front_door_restriction"] : null
  image_name                      = each.value["image_name"]
  inbound_vnet_connectivity       = each.value["inbound_vnet_connectivity"]
  integration_subnet_id           = can(each.value["integration_subnet_id"]) ? each.value["integration_subnet_id"] : null
  key_vault_id                    = each.value["key_vault_access"] ? var.key_vault_id : null
  location                        = var.location
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  monitoring_alerts_enabled       = var.monitoring_alerts_enabled
  outbound_vnet_connectivity      = each.value["outbound_vnet_connectivity"]
  resource_group_name             = var.resource_group_name
  resource_suffix                 = var.resource_suffix
  service_name                    = var.service_name

  tags = var.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
