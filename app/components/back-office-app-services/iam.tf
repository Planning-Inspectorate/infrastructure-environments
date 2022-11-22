resource "azurerm_role_assignment" "documents_access" {
  scope                = var.resource_group_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_case_admin_officer_group_id
}

resource "azurerm_role_assignment" "documents_access" {
  scope                = var.resource_group_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_caseofficer_group_id
}
