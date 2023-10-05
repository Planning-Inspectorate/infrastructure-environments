resource "azurerm_role_assignment" "back_office_app_send_service_bus_access" {
  scope                = var.back_office_service_bus_register_nsip_subscription_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["applications_service_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_app_send_deadline_submission_service_bus_access" {
  scope                = var.back_office_service_bus_deadline_submission_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["applications_service_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_deadline_documents_blob_storage_access" {
  scope                = var.back_office_submissions_storage_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["applications_service_api"].principal_id
}
