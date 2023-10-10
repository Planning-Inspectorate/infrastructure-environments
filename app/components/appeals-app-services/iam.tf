<<<<<<< HEAD
resource "azurerm_role_assignment" "documents_access" {
  scope                = var.resource_group_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["appeal_documents_service_api"].principal_id
}

resource "azurerm_role_assignment" "app_configuration_access" {
  scope                = var.resource_group_id
  role_definition_name = "App Configuration Data Reader"
  principal_id         = module.app_service["appeal_documents_service_api"].principal_id
}

resource "azurerm_role_assignment" "appeals_bo_case_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.appeals_bo_case_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "appeals_bo_document_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.appeals_bo_document_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "listed_building_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.listed_building_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "appeals_fo_send_service_bus_role" {
  scope                = azurerm_servicebus_subscription.listed_building_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.front_office_subscribers[0].principal_id
}
=======
resource "azurerm_role_assignment" "documents_access" {
  scope                = var.resource_group_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.app_service["appeal_documents_service_api"].principal_id
}

resource "azurerm_role_assignment" "app_configuration_access" {
  scope                = var.resource_group_id
  role_definition_name = "App Configuration Data Reader"
  principal_id         = module.app_service["appeal_documents_service_api"].principal_id
}

resource "azurerm_role_assignment" "appeals_bo_case_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.appeals_bo_case_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "appeals_bo_document_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.appeals_bo_document_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "listed_building_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = azurerm_servicebus_subscription.listed_building_topic_subscription[0].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.front_office_subscribers[0].principal_id
}

resource "azurerm_role_assignment" "appeals_fo_send_service_bus_role" {
  count = var.appeals_feature_back_office_subscriber_enabled ? 1 : 0

  scope                = var.service_bus_listed_building_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.front_office_subscribers[0].principal_id
}
>>>>>>> 1ef1dc5d0cbd8284f5417798d49623beb87b0f4e
