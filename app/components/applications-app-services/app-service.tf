module "app_service" {
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules
  for_each = local.app_services

  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/node-app-service?ref=1.33"

  action_group_ids                  = var.action_group_ids
  app_name                          = each.value["app_name"]
  app_service_plan_id               = var.app_service_plan_id
  app_service_private_dns_zone_id   = can(each.value["app_service_private_dns_zone_id"]) ? each.value["app_service_private_dns_zone_id"] : null
  app_settings                      = each.value["app_settings"]
  container_registry_name           = var.container_registry_name
  container_registry_rg             = var.container_registry_rg
  endpoint_subnet_id                = can(each.value["endpoint_subnet_id"]) ? each.value["endpoint_subnet_id"] : null
  front_door_restriction            = can(each.value["front_door_restriction"]) ? each.value["front_door_restriction"] : null
  image_name                        = each.value["image_name"]
  inbound_vnet_connectivity         = each.value["inbound_vnet_connectivity"]
  integration_subnet_id             = can(each.value["integration_subnet_id"]) ? each.value["integration_subnet_id"] : null
  key_vault_id                      = each.value["key_vault_access"] ? var.key_vault_id : null
  location                          = var.location
  log_analytics_workspace_id        = var.log_analytics_workspace_id
  monitoring_alerts_enabled         = var.monitoring_alerts_enabled
  outbound_vnet_connectivity        = each.value["outbound_vnet_connectivity"]
  resource_group_name               = var.resource_group_name
  resource_suffix                   = var.resource_suffix
  service_name                      = var.service_name

  health_check_eviction_time_in_min = var.health_check_eviction_time_in_min
  auth_config = {
    auth_enabled           = var.auth_config.auth_enabled
    require_authentication = var.auth_config.require_authentication
    auth_client_id         = var.auth_config.auth_client_id
    auth_provider_secret   = var.auth_config.auth_provider_secret
    auth_tenant_endpoint   = var.auth_config.auth_tenant_endpoint
    allowed_audiences      = var.auth_config.allowed_audiences
    allowed_applications   = var.auth_config.allowed_applications
  }

  tags = var.tags

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
