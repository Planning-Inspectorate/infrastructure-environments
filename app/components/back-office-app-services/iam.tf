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
