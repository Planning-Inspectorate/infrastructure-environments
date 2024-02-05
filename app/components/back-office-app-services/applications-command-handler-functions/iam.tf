resource "azurerm_role_assignment" "function_blob_data_reader" {
  scope                = var.document_storage_submissions_container_resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = module.applications_command_handler_functions.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_submissions_writer" {
  scope                = var.document_storage_submissions_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.applications_command_handler_functions.principal_id
}

resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.applications_command_handler_functions.principal_id
}

# Deadline Submissions
resource "azurerm_role_assignment" "deadline_submission_data_receiver" {
  scope                = azurerm_servicebus_subscription.deadline_submission_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_command_handler_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_sender" {
  scope                = var.servicebus_topic_deadline_submission_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.applications_command_handler_functions.principal_id
}

resource "azurerm_role_assignment" "service_bus_result_data_sender" {
  scope                = var.servicebus_topic_deadline_submission_result_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.applications_command_handler_functions.principal_id
}

# Handle Subscriptions
resource "azurerm_role_assignment" "handle_subscription_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_nsip_subscription_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_command_handler_functions.principal_id
}

# Register Representations
resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_representation_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.applications_command_handler_functions.principal_id
}
