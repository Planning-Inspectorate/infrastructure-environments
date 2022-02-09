resource "azurerm_app_service" "_" {
  name                = "${var.prefix}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    linux_fx_version                     = "DOCKER|${var.container_registry_login_server}/${var.container_image}:${var.container_image_tag}"
    acr_use_managed_identity_credentials = true
    always_on                            = "true"
  }

  app_settings = merge({
    DOCKER_ENABLE_CI = var.enable_cd
    },
    var.app_settings
  )

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  role_definition_name = "AcrPull"
  scope                = var.container_registry_id
  principal_id         = azurerm_app_service._.identity[0].principal_id
}

//resource "azurerm_private_endpoint" "_" {
//  name                = "${azurerm_app_service._.name}-private-endpoint"
//  location            = var.location
//  resource_group_name = var.resource_group_name
//  subnet_id           = var.subnet_id
//
//  private_dns_zone_group {
//    name                 = "privatednszonegroup"
//    private_dns_zone_ids = [var.private_dns_zone_id]
//  }
//
//  private_service_connection {
//    name                           = "privateendpointconnection"
//    private_connection_resource_id = azurerm_app_service._.id
//    subresource_names              = ["sites"]
//    is_manual_connection           = false
//  }
//}
