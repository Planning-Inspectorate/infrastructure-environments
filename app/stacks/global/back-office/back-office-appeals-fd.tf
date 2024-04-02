module "back_office_appeals_front_door" {
  source = "../../../modules/front-door-premium"
  count  = var.environment == "dev" ? 1 : 0

  domain_name       = local.back_office_appeals.domain
  frontend_endpoint = local.back_office_appeals.frontend_endpoint
  common_tags       = local.tags
  environment       = var.environment
  location          = var.location
  name              = "${local.back_office_appeals.service_name}-${var.environment}"
  sku_name          = "Premium_AzureFrontDoor"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
