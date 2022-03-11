locals {
  api_timeout                                = 10000
  environment                                = "prod"
  common_vnet_address_space                  = "10.3.0.0/16"
  logger_level                               = "info"
  node_environment                           = "production"
  google_analytics_id                        = "tbc"
  national_infrastructure_gateway_ip         = "51.104.42.155"
  national_infrastructure_vnet_address_space = ["10.222.0.0/26"]
  srv_notify_base_url                        = "https://api.notifications.service.gov.uk/"
}
