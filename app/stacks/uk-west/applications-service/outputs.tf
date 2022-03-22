output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services.app_service_urls
}
