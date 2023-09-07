resource "azurerm_role_assignment" "service_bus_data_receiver" {
  scope                = azurerm_servicebus_subscription.register_odw_hrdata_subscription.id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.bo_appeals_hrdata_import_function.principal_id
}
