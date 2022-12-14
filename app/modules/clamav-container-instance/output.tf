output "clamav_app_service_plan_id" {
  description = "ClamAV app service plan ID"
  value       = azurerm_service_plan.clamav_service_plan.id
}
