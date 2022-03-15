output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = { for k, v in module.app_service : "${k}_${var.resource_suffix}" => v.default_site_hostname }
}

output "app_service_principal_ids" {
  description = "A map of frontend app service URLs"
  value       = { for k, v in module.app_service : "${k}_${var.resource_suffix}" => v.principal_id }
}
