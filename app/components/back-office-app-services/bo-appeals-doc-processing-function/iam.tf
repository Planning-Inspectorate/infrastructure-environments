data "azurerm_storage_container" "fo_documents" {
  name                 = "uploads"
  storage_account_name = replace("pinsstdocs${var.resource_suffix}", "-", "")
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.bo_appeals_document_container
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.bo_appeals_doc_processing_function.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = data.azurerm_storage_container.fo_documents
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.bo_appeals_doc_processing_function.principal_id
}
