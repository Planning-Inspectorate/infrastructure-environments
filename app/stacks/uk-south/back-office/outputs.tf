output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value       = length(module.app_services) > 0 ? module.app_services[0].app_service_urls : {}
}

output "web_frontend_url" {
  description = "The URL of the web frontend app service"
  value       = length(module.app_services) > 0 ? module.app_services.web_frontend_url : ""
}

output "appeals_web_frontend_url" {
  description = "The URL of the appeals web frontend app service"
  value       = length(module.app_services) > 0 ? module.app_services.appeals_web_frontend_url : ""
}
