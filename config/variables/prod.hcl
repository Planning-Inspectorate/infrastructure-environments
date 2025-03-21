locals {
  api_timeout                          = 20000
  app_service_plan_sku                 = "P3v2"
  appeals_service_public_url           = "appeal-planning-decision.service.gov.uk"
  appeals_service_ssl_certificate_name = "appealservicecf835e2d-1ed6-460f-aa7c-922922db830e"
  applications_service_public_url      = "national-infrastructure-consenting.planninginspectorate.gov.uk"
  back_office_public_url               = "back-office-prod.planninginspectorate.gov.uk"
  back_office_public_url_new           = "back-office-applications.planninginspectorate.gov.uk"
  feature_front_door_failover_enaled   = false
  environment                          = "prod"
  enable_search_indexing_by_default    = true
  front_door_waf_mode                  = "Prevention"
  front_door_waf_appeals_redirect_path = "/error/firewall-error"
  logger_level                         = "info"
  monitoring_alerts_enabled            = true
  primary_vnet_address_space           = "10.3.0.0/16"
  secondary_vnet_address_space         = "10.13.0.0/16"
  srv_notify_base_url                  = "https://api.notifications.service.gov.uk/"
  appeals_easy_auth_config             = {
      "client_id"         = "31bbeefd-e00b-4ef9-b12d-145e06e4ab43"
      "web_auth_enabled"  = false
      "application_id"    = "cfbeda8b-8a44-443f-be26-59b180dd01c1"
  }
}
