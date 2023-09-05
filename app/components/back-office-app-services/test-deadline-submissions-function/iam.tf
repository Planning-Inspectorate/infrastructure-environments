resource "azurerm_role_assignment" "function_blob_data_writer" {
  scope                = var.document_storage_submissions_container_resource_manager_id
  role_definition_name = "Storage Blog Data Contributor"
  principal_id         = module.test_deadline_submissions_function.principal_id
}

resource "azurerm_role_assignment" "service_bus_data_writer" {
  scope                = var.deadline_submission_subscription_id
  role_definition_name = "Azure Service Bus Data Writer"
  principal_id         = module.test_deadline_submissions_function.principal_id
}