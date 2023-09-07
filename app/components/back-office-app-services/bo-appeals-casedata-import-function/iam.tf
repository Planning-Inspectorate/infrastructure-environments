resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_fo_casedata_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.bo_appeals_casedata_import_function.principal_id
}
