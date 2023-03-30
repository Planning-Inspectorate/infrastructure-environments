resource "azurerm_role_assignment" "function_blob_data_owner" {
  scope                = var.document_storage_back_office_documents_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = module.publish_document_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = var.servicebus_queue_nsip_documents_to_publish_id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.publish_document_functions.principal_id
}
