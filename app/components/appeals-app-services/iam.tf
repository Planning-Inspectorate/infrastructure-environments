resource "azurerm_role_assignment" "documents_access" {
  scope                = var.resource_group_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["appeal_documents_service_api"].principal_id
}
