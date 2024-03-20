module "published_documents_front_door" {
  source = "../../../modules/front-door"

  domain_name           = local.published_documents.domain
  blob_storage_endpoint = local.published_documents.blob_endpont
  # common_log_analytics_workspace_id = var.common_log_analytics_workspace_id
  common_tags = local.tags
  environment = var.environment
  location    = var.location
  name        = "${local.service_name}-${var.environment}"
  sku_name    = "Standard_AzureFrontDoor"

  providers = {
    azurerm         = azurerm
    azurerm.tooling = azurerm.tooling
  }
}
