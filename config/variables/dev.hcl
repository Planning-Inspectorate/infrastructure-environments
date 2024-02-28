locals {
  api_timeout                          = 20000
  app_service_plan_sku                 = "P2v2"
  appeals_service_public_url           = "appeals-service-dev.planninginspectorate.gov.uk"
  applications_service_public_url      = "applications-service-dev.planninginspectorate.gov.uk"
  back_office_public_url               = "back-office-dev.planninginspectorate.gov.uk"
  back_office_appeals_public_url       = "back-office-appeals-dev.planninginspectorate.gov.uk"
  comment_planning_appeal_public_url   = "comment-planning-appeal-dev.planninginspectorate.gov.uk"
  feature_front_door_failover_enaled   = false
  database_public_access_enabled       = true
  enable_search_indexing_by_default    = false
  environment                          = "dev"
  front_door_waf_appeals_redirect_path = "/errors/firewall-error"
  front_door_waf_mode                  = "Prevention"
  logger_level                         = "debug"
  monitoring_alerts_enabled            = true
  primary_vnet_address_space           = ["10.1.0.0/16"]
  private_endpoint_enabled             = false
  secondary_vnet_address_space         = ["10.11.0.0/16"]
  srv_notify_base_url                  = "https://api.notifications.service.gov.uk/"
}
