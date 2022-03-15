module "app_service" {
  for_each = local.app_services

  source = "../../modules/node-app-service"

  app_insights_connection_string     = var.app_insights_connection_string
  app_insights_instrumentation_key   = var.app_insights_instrumentation_key
  app_name                           = each.value["app_name"]
  app_service_plan_id                = var.app_service_plan_id
  app_service_private_dns_zone_id    = can(each.value["app_service_private_dns_zone_id"]) ? each.value["app_service_private_dns_zone_id"] : null
  app_settings                       = each.value["app_settings"]
  container_registry_login_server    = var.container_registry_login_server
  container_registry_server_password = var.container_registry_password
  container_registry_server_username = var.container_registry_username
  endpoint_subnet_id                 = can(each.value["endpoint_subnet_id"]) ? each.value["endpoint_subnet_id"] : null
  inbound_vnet_connectivity          = each.value["inbound_vnet_connectivity"]
  integration_subnet_id              = can(each.value["integration_subnet_id"]) ? each.value["integration_subnet_id"] : null
  key_vault_id                       = each.value["key_vault_access"] ? var.key_vault_id : null
  location                           = var.location
  outbound_vnet_connectivity         = each.value["outbound_vnet_connectivity"]
  resource_group_name                = var.resource_group_name
  resource_suffix                    = var.resource_suffix
  service_name                       = var.service_name

  tags = var.tags
}
