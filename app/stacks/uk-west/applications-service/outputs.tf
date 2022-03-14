output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = module.app_services[0].app_service_urls
}
