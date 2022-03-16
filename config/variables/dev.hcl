locals {
  api_timeout                     = 10000
  appeals_service_public_url      = "appeals-service-dev.planninginspectorate.gov.uk"
  applications_service_public_url = "applications-service-dev.planninginspectorate.gov.uk"
  environment                     = "dev"
  logger_level                    = "info"
  node_environment                = "production"
  primary_vnet_address_space      = ["10.1.0.0/16"]
  secondary_vnet_address_space    = ["10.11.0.0/16"]
  srv_notify_base_url             = "https://api.notifications.service.gov.uk/"
}
