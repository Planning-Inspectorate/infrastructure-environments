output "ni_frontend_url" {
  description = "The URL of the applications service national infrastructure frontend app service"
  value       = module.national_infrastructure_frontend.default_site_hostname
}
