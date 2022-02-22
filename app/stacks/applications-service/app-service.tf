# module "national_infrastructure_frontend" {
#   source = "../../modules/node-app-service"
#
#   app_insights_connection_string   = var.app_insights_connection_string
#   app_insights_instrumentation_key = var.app_insights_instrumentation_key
#   app_name                         = "ni-wfe"
#   app_service_plan_id              = var.app_service_plan_id
#   app_type                         = "frontend"
#   container_image                  = ""
#   container_image_tag              = ""
#   container_registry_id            = data.azurerm_container_registry.acr.id
#   container_registry_login_server  = data.azurerm_container_registry.acr.login_server
#   location                         = azurerm_resource_group.applications_service_stack.location
#   resource_group_name              = azurerm_resource_group.applications_service_stack.name
#   resource_suffix                  = local.resource_suffix
#   service_name                     = local.service_name
#   subnet_id                        = azurerm_subnet.integration_subnet.id
#
#   app_settings = {
#
#   }
#
#   tags = local.tags
# }

module "national_infrastructure_service" {
  source = "../../modules/node-app-service"

  app_insights_connection_string   = var.app_insights_connection_string
  app_insights_instrumentation_key = var.app_insights_instrumentation_key
  app_name                         = "ni-api"
  app_service_plan_id              = var.app_service_plan_id
  app_type                         = "backend"
  container_image                  = ""
  container_image_tag              = ""
  container_registry_id            = data.azurerm_container_registry.acr.id
  container_registry_login_server  = data.azurerm_container_registry.acr.login_server
  private_dns_zone_id              = azurerm_private_dns_zone.private_link.id
  location                         = azurerm_resource_group.applications_service_stack.location
  resource_group_name              = azurerm_resource_group.applications_service_stack.name
  resource_suffix                  = local.resource_suffix
  service_name                     = local.service_name
  subnet_id                        = azurerm_subnet.endpoint_subnet.id

  app_settings = {

  }

  tags = local.tags
}
