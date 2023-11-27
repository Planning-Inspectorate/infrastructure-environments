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

resource "azurerm_role_assignment" "back_office_app_send_register_representation" {
  scope                = var.back_office_service_bus_register_representation_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["applications_service_api"].principal_id
}

resource "azurerm_role_assignment" "back_office_deadline_documents_blob_storage_access" {
  scope                = var.back_office_submissions_storage_container_resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["applications_service_api"].principal_id
}

resource "azurerm_key_vault_access_policy" "bo_subscribers_read_secrets" {
  count = var.feature_back_office_subscriber_enabled ? 1 : 0

  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.back_office_subscribers[0].principal_id

  certificate_permissions = []
  key_permissions         = []
  secret_permissions      = ["Get"]
  storage_permissions     = []
}
