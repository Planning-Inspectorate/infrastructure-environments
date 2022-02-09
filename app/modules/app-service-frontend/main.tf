resource "azurerm_app_service" "_" {
  name                = "${var.prefix}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    linux_fx_version = "DOCKER|${var.container_registry_login_server}/${var.container_image}:${var.container_image_tag}"
    always_on        = "true"
  }

  app_settings = var.app_settings
  tags         = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "_" {
  app_service_id = azurerm_app_service._.id
  subnet_id      = var.subnet_id
}
