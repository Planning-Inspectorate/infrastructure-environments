module "appeals_back_office" {
  source = "../../../../components/back-office-app-services/appeals-back-office-fd"

  domain_name       = var.domain_name
  common_tags       = local.tags
  environment       = var.environment
  frontend_endpoint = var.frontend_endpoint
  location          = var.location
  name              = "${local.service_name}-${var.environment}"
  sku_name          = var.sku_name
  origin            = var.origin
  route             = var.route

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
