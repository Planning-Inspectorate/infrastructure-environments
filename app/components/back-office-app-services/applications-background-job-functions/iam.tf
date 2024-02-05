resource "azurerm_role_assignment" "nsip_project_update_service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.nsip_project_update_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_background_job_functions.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_background_job_functions.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_back_office_published_documents_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.applications_background_job_functions.principal_id
}

resource "azurerm_role_assignment" "nsip_document_service_bus_data_published_receiver" {
  scope                = azurerm_servicebus_subscription.nsip_document_published_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_background_job_functions.principal_id
}

resource "azurerm_role_assignment" "nsip_document_service_bus_data_unpublished_receiver" {
  scope                = azurerm_servicebus_subscription.nsip_document_unpublished_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_background_job_functions.principal_id
}
