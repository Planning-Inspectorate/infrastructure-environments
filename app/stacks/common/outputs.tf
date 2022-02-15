output "app_service_plan_id" {
  description = "The id of the app service plan"
  value       = azurerm_app_service_plan.common_service_plan.id
}
