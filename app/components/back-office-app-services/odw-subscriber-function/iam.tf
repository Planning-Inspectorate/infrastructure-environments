resource "azurerm_role_assignment" "function_blob_data_owner" {
  scope                = azurerm_servicebus_subscription.employee_topic_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.odw_subscriber_function.principal_id
}
