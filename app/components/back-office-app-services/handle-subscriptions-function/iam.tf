resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_nsip_subscription_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.handle_subscriptions_function.principal_id
}
