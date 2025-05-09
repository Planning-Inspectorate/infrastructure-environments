locals {
  activate_planned_outage                                               = "false"
  apps_config = {
    app_service_plan = {
      sku                      = "P0v3"
      per_site_scaling_enabled = false
      worker_count             = 1
      zone_balancing_enabled   = false
    }
  }
  applications_easy_auth_config = {
      "client_id"         = "2f5cb0e8-5df8-49f4-8fa7-c3277a0a8632"
      "web_auth_enabled"  = true
      "application_id"    = "7d92b220-8d5b-45d6-a870-39464439d6b1"
  }
  back_office_integration_case_references                               = "BC0110001,BC0110003,BC0110004,BC0110005,BC0110013,BC0110036,BC0011028"
  back_office_integration_get_applications                              = "MERGE"
  documents_host                                                        = "https://nipreprod.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_project_information                                     = "true"
  feature_allow_welsh_translation                                       = "true"
  feature_custom_folders                                                = "true"
  feature_application_insights                                          = "true"
  feature_enable_generalised_form_sanitisation                          = "true"
  feature_enabled_content_security_policy                               = "true"
  feature_general_s51_bo                                                = "false"
  feature_register_of_advice                                            = "false"
  feature_allow_welsh_cases                                             = "false"
  feature_hide_project_timeline_link                                    = "false"
  feature_home_page                                                     = "true"
  feature_primary_navigation                                            = "true"
  feature_redis_session_store                                           = "true"
  feature_save_and_exit_option                                          = "false"
  feature_show_affected_area_section                                    = "false"
  google_analytics_id                                                   = "G-566E329TBN"
  monitoring_config                    = {
    app_insights_web_test_enabled = false
  }
  national_infrastructure_gateway_ip                                    = "51.141.40.109"
  national_infrastructure_vnet_address_space                            = ["10.0.0.0/20"]
  node_environment                                                      = "production"
  open_registration_case_references                                     = ""
  planned_outage_resume_text                                            = ""
  srv_notify_ip_registration_confirmation_email_to_ip_template_id       = "830c9c01-1f81-4198-be72-11ab173c128a"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh = "a773d70c-ebbc-42dc-b4c8-d862eb9e67de"
  srv_notify_service_id                                                 = "9b89eb93-3071-432c-9c6b-4e07dbda9071"
  srv_notify_submission_complete_email_template_id                      = "e900038b-f112-4862-9a93-0b8bbb48a09c"
  srv_notify_submission_complete_email_template_id_welsh                = "23bcc129-d6b7-4f8b-baf8-e9713de007fe"
  srv_notify_subscription_create_email_template_id                      = "cb987449-fad5-485f-aef1-9c5c616c6d42"
  srv_notify_subscription_create_email_template_id_welsh                = "924ab550-4e03-402f-991e-06fdada06064"
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 7
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-test-applications-fo"
    object_id      = "944d3590-9e63-402b-9c5d-b6f43fb2e897"
  }
}
