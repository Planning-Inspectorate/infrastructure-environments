locals {
  activate_planned_outage                                         = "false"
  back_office_integration_case_references                         = "EN0710001,EN0710002,EN0110001,EN0110003,EN0110002,EN0210001"
  back_office_integration_get_applications                        = "MERGE"
  documents_host                                                  = "https://infrastructure.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_document_library                                  = "true"
  feature_allow_examination_timetable                             = "true"
  feature_allow_project_information                               = "true"
  feature_allow_representation                                    = "true"
  feature_allow_section_51                                        = "true"
  feature_allow_welsh_translation                                 = "false"
  feature_application_insights                                    = "true"
  feature_enable_generalised_form_sanitisation                    = "true"
  feature_enabled_content_security_policy                         = "true"
  feature_hide_project_timeline_link                              = "false"
  feature_home_page                                               = "true"
  feature_primary_navigation                                      = "true"
  feature_redis_session_store                                     = "true"
  feature_save_and_exit_option                                    = "false"
  feature_show_affected_area_section                              = "false"
  google_analytics_id                                             = "G-DQ9S57CJDP"
  national_infrastructure_gateway_ip                              = "51.140.221.209"
  national_infrastructure_vnet_address_space                      = ["10.224.161.0/24", "192.168.0.0/20"]
  node_environment                                                = "production"
  open_registration_case_references                               = ""
  planned_outage_resume_text                                      = ""
  private_beta_v1_routes_only                                     = "false"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id = "442ee953-7bd2-4b44-aa38-9dc8a3e42ab4"
  srv_notify_magic_link_email_template_id                         = "0f4635cf-eed0-487a-83ff-a325800f9c9c"
  srv_notify_service_id                                           = "2f25f917-c24f-44a6-9d0c-aebac7c98081"
  srv_notify_submission_complete_email_template_id                = "47a18e22-7374-4a3a-8048-8f895e127b93"
  srv_notify_subscription_create_email_template_id                = "90437d7a-e153-4126-b65b-7ae36775fca2"
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 30
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-prod-applications-fo"
    object_id      = "b8d20cbf-dc58-4604-91e5-e8e8d98c8d84"
  }
}
