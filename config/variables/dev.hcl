locals {
  api_timeout                     = 10000
  appeals_service_public_url      = "appeals-service-dev.planninginspectorate.gov.uk"
  applications_service_public_url = "applications-service-dev.planninginspectorate.gov.uk"
  back_office_public_url          = "back-office-dev.planninginspectorate.gov.uk"
  cosmosdb_enable_public_access   = true
  environment                     = "dev"
  logger_level                    = "info"
  monitoring_alerts_enabled       = false
  node_environment                = "development"
  primary_vnet_address_space      = ["10.1.0.0/16"]
  secondary_vnet_address_space    = ["10.11.0.0/16"]
  srv_notify_base_url             = "https://api.notifications.service.gov.uk/"
}
