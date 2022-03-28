output "app_service_ids" {
  description = "A list of app service IDs"
  value       = [for k, v in module.app_service : v.app_service_id]
}

output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = { for k, v in module.app_service : "${k}_${module.azure_region.location_short}" => v.default_site_hostname }
}

output "app_service_principal_ids" {
  description = "A map of frontend app service URLs"
  value       = { for k, v in module.app_service : "${k}_${module.azure_region.location_short}" => v.principal_id }
}
