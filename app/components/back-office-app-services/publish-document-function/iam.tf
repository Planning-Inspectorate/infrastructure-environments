resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.publish_document_functions.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_back_office_published_documents_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.publish_document_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = var.servicebus_queue_nsip_documents_to_publish_id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.publish_document_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_sender" {
  scope                = var.servicebus_topic_nsip_documents_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.publish_document_functions.principal_id
}
