output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = length(module.app_services) > 0 ? module.app_services[0].app_service_urls : {}
}
