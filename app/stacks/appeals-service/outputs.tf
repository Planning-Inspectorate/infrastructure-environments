output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value = {
    appeals_service_frontend = module.appeal_service_frontend.default_site_hostname
    # lpa_questionnaire_frontend =
  }
}
