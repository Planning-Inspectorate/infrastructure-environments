module "appeals_back_office" {
  source = "../../../components/back-office-app-services/appeals-back-office-fd"

  # domain_name       = var.back_office_appeals_public_url
  # common_tags       = local.tags
  # environment       = var.environment
  # frontend_endpoint = var.back_office_appeals_primary_app_service_url
  # location          = var.location
  # name              = "${var.appeals_back_office_service_name}-${var.environment}"
  # sku_name          = "Premium_AzureFrontDoor"
  # origin            = var.origin
  # route             = var.route

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
