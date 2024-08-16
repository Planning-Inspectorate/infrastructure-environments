locals {
  api_timeout                                = 20000
  service_plan_sku                           = "P0v3"
  app_service_plan_sku                       = "P1v3"
  integration_functions_app_service_plan_sku = "P0v3"
  appeals_service_public_url                 = "appeals-service-training.planninginspectorate.gov.uk"
  applications_service_public_url            = "applications-service-training.planninginspectorate.gov.uk"
  back_office_public_url                     = "back-office-training.planninginspectorate.gov.uk"
  comment_planning_appeal_public_url         = "comment-planning-appeal-training.planninginspectorate.gov.uk"
  feature_front_door_failover_enaled         = false
  environment                                = "training"
  enable_search_indexing_by_default          = false
  front_door_waf_mode                        = "Prevention"
  front_door_waf_appeals_redirect_path       = "/error/firewall-error"
  logger_level                               = "info"
  monitoring_alerts_enabled                  = true
  primary_vnet_address_space                 = "10.16.0.0/16"
  secondary_vnet_address_space               = "10.17.0.0/16"
  srv_notify_base_url                        = "https://api.notifications.service.gov.uk/"
}
