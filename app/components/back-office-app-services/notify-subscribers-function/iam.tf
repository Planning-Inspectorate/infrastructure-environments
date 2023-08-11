resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.nsip_project_update_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.notify_subscribers_function.principal_id
}
