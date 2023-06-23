locals {
  api_timeout                        = 20000
  app_service_plan_sku               = "P2v2"
  appeals_service_public_url         = "appeals-service-test.planninginspectorate.gov.uk"
  applications_service_public_url    = "applications-service-test.planninginspectorate.gov.uk"
  back_office_public_url             = "back-office-test.planninginspectorate.gov.uk"
  back_office_appeals_public_url     = "back-office-appeals-test.planninginspectorate.gov.uk"
  feature_front_door_failover_enaled = false
  environment                        = "test"
  enable_search_indexing_by_default  = false
  front_door_waf_mode                = "Prevention"
  logger_level                       = "info"
  monitoring_alerts_enabled          = false
  primary_vnet_address_space         = "10.2.0.0/16"
  secondary_vnet_address_space       = "10.12.0.0/16"
  srv_notify_base_url                = "https://api.notifications.service.gov.uk/"
}
