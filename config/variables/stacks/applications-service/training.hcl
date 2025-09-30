locals {
  activate_planned_outage = "false"
  apps_config = {
    app_service_plan = {
      sku                      = "P0v3"
      per_site_scaling_enabled = false
      worker_count             = 1
      zone_balancing_enabled   = false
    }
  }
  applications_easy_auth_config = {
    "client_id"        = "2f5cb0e8-5df8-49f4-8fa7-c3277a0a8632"
    "web_auth_enabled" = true
    "application_id"   = "4c373f03-2609-4cfe-a9f1-c8db2869c923"
  }
  back_office_integration_case_references      = "EN0710001,EN0710002,EN0110001,EN0110003,EN0110002,EN0210001"
  back_office_integration_get_applications     = "BO"
  documents_host                               = "https://infrastructure.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  document_storage_api_host                    = "https://nsip-documents.planninginspectorate.gov.uk/"
  feature_allow_project_information            = "true"
  feature_allow_welsh_translation              = "true"
  feature_custom_folders                       = "true"
  feature_application_insights                 = "true"
  feature_enable_generalised_form_sanitisation = "true"
  feature_enabled_content_security_policy      = "true"
  feature_general_s51_bo                       = "false"
  feature_register_of_advice                   = "false"
  feature_allow_welsh_cases                    = "true"
  feature_hide_project_timeline_link           = "false"
  feature_home_page                            = "true"
  feature_primary_navigation                   = "true"
  feature_redis_session_store                  = "true"
  feature_save_and_exit_option                 = "false"
  feature_show_affected_area_section           = "false"
  google_analytics_id                          = "G-DQ9S57CJDP"
  log_daily_cap_gb                             = 0.4
  monitoring_alerts_enabled                    = true
  monitoring_config = {
    app_insights_web_test_enabled = true
  }
  national_infrastructure_gateway_ip                                    = "51.140.221.209"
  national_infrastructure_vnet_address_space                            = ["10.224.161.0/24", "192.168.0.0/20"]
  node_environment                                                      = "production"
  open_registration_case_references                                     = ""
  planned_outage_resume_text                                            = ""
  redis_cache_configuration = {
    family   = "C"
    capacity = 0
    sku_name = "Basic"
  }
  srv_notify_ip_registration_confirmation_email_to_ip_template_id       = "442ee953-7bd2-4b44-aa38-9dc8a3e42ab4"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh = "b7559278-492b-4e4d-899c-484c03d05335"
  srv_notify_service_id                                                 = "2f25f917-c24f-44a6-9d0c-aebac7c98081"
  srv_notify_submission_complete_email_template_id                      = "47a18e22-7374-4a3a-8048-8f895e127b93"
  srv_notify_submission_complete_email_template_id_welsh                = "30f2da00-a82b-4435-aaf6-6178954d6405"
  srv_notify_subscription_create_email_template_id                      = "90437d7a-e153-4126-b65b-7ae36775fca2"
  srv_notify_subscription_create_email_template_id_welsh                = "6399f8d8-6684-4aff-bae9-6e4138a09cdf"
  sql_database_configuration = {
    max_size_gb               = 250 # included
    short_term_retention_days = 7
    audit_retention_days      = 30
    sku_name                  = "S0"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-training-applications-fo"
    object_id      = "208d7e7a-09d0-497a-87e6-0c19ad3c688d"
  }
}
