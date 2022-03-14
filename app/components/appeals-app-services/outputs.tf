output "app_service_urls" {
  description = "A map of frontend app service URLs"
  value = {
    appeals_frontend = module.appeals_frontend.default_site_hostname
  }
}

output "appeal_documents_app_service_principal_id" {
  description = "The ID of the principal associated with the Appeal Documents API App Service"
  value       = module.appeal_documents_service_api.principal_id
}
