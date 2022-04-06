locals {
  api_timeout                     = 10000
  appeals_service_public_url      = "appeals-service-test.planninginspectorate.gov.uk"
  applications_service_public_url = "applications-service-test.planninginspectorate.gov.uk"
  back_office_public_url          = "back-office-test.planninginspectorate.gov.uk"
  environment                     = "test"
  logger_level                    = "info"
  monitoring_alerts_enabled       = false
  node_environment                = "production"
  primary_vnet_address_space      = "10.2.0.0/16"
  secondary_vnet_address_space    = "10.12.0.0/16"
  srv_notify_base_url             = "https://api.notifications.service.gov.uk/"
}
