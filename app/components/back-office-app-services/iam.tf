resource "azurerm_role_assignment" "applications_case_admin_officer_documents_access" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_case_admin_officer_group_id
}

resource "azurerm_role_assignment" "applications_caseteam_documents_access" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_caseteam_group_id
}

resource "azurerm_role_assignment" "applications_inspector_documents_access" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.azuread_applications_inspector_group_id
}

# For now, allow the back office to publish to all topics in the namespace - we can scope this down to topics later
resource "azurerm_role_assignment" "back_office_app_send_service_bus_access" {
  scope                = var.service_bus_namespace_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["back_office_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_app_send_event_grid" {
  scope                = var.malware_scanning_topic_id
  role_definition_name = "EventGrid Data Sender"
  principal_id         = module.app_service["back_office_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_api_blob_data_writer" {
  scope                = var.document_storage_back_office_document_service_uploads_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["back_office_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_web_language_reader" {
  count                = var.text_analytics_config == null ? 0 : 1
  scope                = var.text_analytics_config.id
  role_definition_name = "Cognitive Services Language Reader"
  principal_id         = module.app_service["back_office_frontend"].principal_id
}
