resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = var.front_office_storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.bo_appeals_doc_processing_function.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.back_office_appeals_document_container
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.bo_appeals_doc_processing_function.principal_id
}
