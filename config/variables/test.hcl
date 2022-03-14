locals {
  api_timeout                                = 10000
  appeals_service_public_url                 = "appeals-service-test.planninginspectorate.gov.uk"
  applications_service_public_url            = "applications-service-test.planninginspectorate.gov.uk"
  environment                                = "test"
  google_analytics_id                        = "G-X21W2S2FN3"
  national_infrastructure_gateway_ip         = "51.104.42.155"
  national_infrastructure_vnet_address_space = ["10.222.0.0/26"]
  primary_vnet_address_space                 = "10.2.0.0/16"
  secondary_vnet_address_space               = "10.12.0.0/16"
  srv_notify_base_url                        = "https://api.notifications.service.gov.uk/"
}
