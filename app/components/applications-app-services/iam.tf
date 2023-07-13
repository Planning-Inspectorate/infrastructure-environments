resource "azurerm_role_assignment" "back_office_app_send_service_bus_access" {
  scope                = var.back_office_service_bus_register_nsip_subscription_topic_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.app_service["applications_service_api"].principal_id
}
