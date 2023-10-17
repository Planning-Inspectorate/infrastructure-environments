resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_back_office_published_documents_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.unpublish_document_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.nsip_document_updated_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.unpublish_document_functions.principal_id
}
