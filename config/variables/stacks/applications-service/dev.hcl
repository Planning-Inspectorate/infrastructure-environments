locals {
  documents_host                                                  = "https://nitestaz.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_document_library                                  = "true"
  feature_allow_examination_timetable                             = "true"
  feature_allow_representation                                    = "true"
  feature_hide_project_timeline_link                              = "false"
  feature_redis_session_store                                     = "true"
  feature_save_and_exit_option                                    = "false"
  feature_show_affected_area_section                              = "false"
  feature_enabled_content_security_policy                         = "true"
  feature_allow_section_51                                        = "true"
  feature_enable_generalised_form_sanitisation                    = "true"
  google_analytics_id                                             = "G-X21W2S2FN3"
  national_infrastructure_gateway_ip                              = "51.104.42.155"
  national_infrastructure_vnet_address_space                      = ["10.222.0.0/26"]
  node_environment                                                = "development"
  private_beta_v1_routes_only                                     = "false"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = "830c9c01-1f81-4198-be72-11ab173c128a"
  srv_notify_magic_link_email_template_id                         = "4ca6b93a-4c45-4abe-a8ea-69ba13c80915"
  srv_notify_service_id                                           = "9b89eb93-3071-432c-9c6b-4e07dbda9071"
  srv_notify_submission_complete_email_template_id                = "e900038b-f112-4862-9a93-0b8bbb48a09c"
  sql_database_configuration = {
    max_size_gb               = 2
    short_term_retention_days = 7
    sku_name                  = "Basic"
  }
  sql_server_azuread_administrator = {
    login_username = "James.Paterson2@planninginspectorate.gov.uk"
    object_id      = "d030a708-707d-4361-9bfc-3cfb82d9c876"
  }
}
