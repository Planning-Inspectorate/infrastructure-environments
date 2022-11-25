resource "azurerm_role_assignment" "applications_case_admin_officer_documents_access" {
  scope                = var.document_storage_back_office_documents_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_case_admin_officer_group_id
}

resource "azurerm_role_assignment" "applications_caseofficer_documents_access" {
  scope                = var.document_storage_back_office_documents_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_caseofficer_group_id
}

# For now, allow the back office to publish to all topics in the namespace - we can scope this down to topics later
resource "azurerm_role_assignment" "back_office_app_send_service_bus_access" {
  scope                = var.service_bus_namespace_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["back_office_api"].principal_id
}
