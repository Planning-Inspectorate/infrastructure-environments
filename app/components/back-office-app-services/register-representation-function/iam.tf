resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_representation_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.register_representation_function.principal_id
}
