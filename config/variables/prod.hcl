locals {
  api_timeout                     = 10000
  appeals_service_public_url      = "appeals-service-prod.planninginspectorate.gov.uk"      # "appeal-planning-decision.planninginspectorate.gov.uk"
  applications_service_public_url = "applications-service-prod.planninginspectorate.gov.uk" # "www.national-infrastructure.planninginspectorate.gov.uk"
  environment                     = "prod"
  logger_level                    = "info"
  monitoring_alerts_enabled       = true
  node_environment                = "production"
  primary_vnet_address_space      = "10.3.0.0/16"
  secondary_vnet_address_space    = "10.13.0.0/16"
  srv_notify_base_url             = "https://api.notifications.service.gov.uk/"
}
