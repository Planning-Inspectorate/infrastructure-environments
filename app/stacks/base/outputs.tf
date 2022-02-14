output "app_service_plan_id" {
  description = "The id of the app service plan"
  value       = azurerm_app_service_plan.base_service_plan.id
}

output "cosmodb_connection_string" {
  description = "The primary connection string used to connect to the MongoDB instance"
  value       = azurerm_cosmosdb_account.odt.connection_strings[0]
  sensitive   = true
}
