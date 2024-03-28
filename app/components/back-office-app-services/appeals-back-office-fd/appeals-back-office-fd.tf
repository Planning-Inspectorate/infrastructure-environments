module "appeals_back_office" {
  source = "github.com/Planning-Inspectorate/infrastructure-modules.git//modules/azure-front-door?ref=1.20"
  #checkov:skip=CKV_TF_1: Use of commit hash are not required for our Terraform modules

  domain_name       = var.domain_name
  common_tags       = var.common_tags
  environment       = var.environment
  frontend_endpoint = var.frontend_endpoint
  location          = var.location
  name              = var.name
  sku_name          = var.sku_name
  origin            = var.origin
  route             = var.route


  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
