locals {
  activate_planned_outage                                         = "false"
  back_office_integration_case_references                         = "BC0110001,BC0110003,BC0110004,BC0110005,BC0110013,BC0110036,BC0011028"
  back_office_integration_get_applications                        = "NI"
  documents_host                                                  = "https://nipreprod.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_document_library                                  = "true"
  feature_allow_examination_timetable                             = "true"
  feature_allow_get_updates                                       = "true"
  feature_allow_have_your_say                                     = "true"
  feature_allow_project_information                               = "true"
  feature_allow_representation                                    = "true"
  feature_allow_section_51                                        = "true"
  feature_allow_welsh_translation                                 = "true"
  feature_application_insights                                    = "true"
  feature_enable_generalised_form_sanitisation                    = "true"
  feature_enabled_content_security_policy                         = "true"
  feature_hide_project_timeline_link                              = "false"
  feature_home_page                                               = "true"
  feature_primary_navigation                                      = "true"
  feature_redis_session_store                                     = "true"
  feature_save_and_exit_option                                    = "false"
  feature_show_affected_area_section                              = "false"
  google_analytics_id                                             = "G-566E329TBN"
  national_infrastructure_gateway_ip                              = "51.141.40.109"
  national_infrastructure_vnet_address_space                      = ["10.0.0.0/20"]
  node_environment                                                = "production"
  open_registration_case_references                               = ""
  planned_outage_resume_text                                      = ""
  private_beta_v1_routes_only                                     = "false"
  project_migration_case_references                               = "BC0110001,BC0110003,BC0110004,BC0110005,BC0110002,BC0110005,BC0110013,BC030001,BC0310003,EN010095,EN010118,EN010120,TR010054,WA0110001,WS0110027,BC010060,BC010022,BC010044,BC010029,BC010033,BC010014,BC010039,BC010046,BC010053"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = "830c9c01-1f81-4198-be72-11ab173c128a"
  srv_notify_magic_link_email_template_id                         = "4ca6b93a-4c45-4abe-a8ea-69ba13c80915"
  srv_notify_service_id                                           = "9b89eb93-3071-432c-9c6b-4e07dbda9071"
  srv_notify_submission_complete_email_template_id                = "e900038b-f112-4862-9a93-0b8bbb48a09c"
  srv_notify_subscription_create_email_template_id                = "cb987449-fad5-485f-aef1-9c5c616c6d42"
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
