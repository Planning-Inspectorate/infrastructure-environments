resource "azurerm_role_assignment" "function_blob_data_owner" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = module.anti_virus_functions.principal_id
}

resource "azurerm_role_assignment" "function_queue_data_contributor" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = module.anti_virus_functions.principal_id
}
