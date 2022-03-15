output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value = {
    applications_frontend = module.applications_frontend.default_site_hostname
  }
}
