output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value = {
    national_infrastructure_frontend = module.national_infrastructure_frontend.default_site_hostname
  }
}
