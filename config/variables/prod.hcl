locals {
  api_timeout                                = 10000
  appeals_service_public_url                 = "appeals-service-prod.planninginspectorate.gov.uk"      # "appeal-planning-decision.planninginspectorate.gov.uk"
  applications_service_public_url            = "applications-service-prod.planninginspectorate.gov.uk" # "www.national-infrastructure.planninginspectorate.gov.uk"
  environment                                = "prod"
  common_vnet_address_space                  = "10.3.0.0/16"
  logger_level                               = "info"
  node_environment                           = "production"
  google_analytics_id                        = "tbc"
  national_infrastructure_gateway_ip         = "51.104.42.155"
  national_infrastructure_vnet_address_space = ["10.222.0.0/26"]
  srv_notify_base_url                        = "https://api.notifications.service.gov.uk/"
}
