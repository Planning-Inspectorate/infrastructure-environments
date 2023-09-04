resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = var.document_storage_submissions_container_resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.deadline_submissions_function.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.deadline_submissions_function.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.deadline_submission_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.deadline_submissions_function.principal_id
}
