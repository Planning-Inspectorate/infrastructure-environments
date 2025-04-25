locals {
  activate_planned_outage                                               = "false"
  apps_config = {
    app_service_plan = {
      sku                      = "P1v3"
      per_site_scaling_enabled = true
      worker_count             = 3
      zone_balancing_enabled   = false # not supported in uk-west
    }
  }
  back_office_integration_case_references                               = "EN010152,WW010002,EN020023,TR050008,EN010126,EN020025,EN010157,TR040010,TR010033,EN010111,EN060006,TR040012,TR050003,WA010002,TR030005,TR020004,EN010102,EN010141,EN010144,EN010150,EN010148,EN010153,EN010154,EN010159,EN020027,EN020033,TR050009,EN030003,EN020034,WA010003,EN010151,EN010158,EN010162,EN010163,EN010165,EN010168,EN010169,EN010160,EN010167,EN010170,TR010015,EN040001,EN020036,WA010005,WA010006,WA020001,WA010004,EN010161,EN010073,EN010069,EN010021,EN010016,EN010024,EN060001,TR010021,EN020026,EN010036,EN010038,EN010039,EN010048,EN010050,EN010053,EN010060,EN010064,EN010068,EN010071,EN020001,EN020009,EN020017,EN060004,EN070001,EN070003,TR010018,TR010019,TR010020,TR030002,EN010051,EN010056,EN010081,EN010082,EN010080,TR030003,TR040004,TR040005,TR050001,EN010084,EN020019,EN020021,TR040002,TR050002,WS010001,WS010003,EN030001,EN010023,EN010155,TR040001,EN030002,TR010016,TR010022,TR030001,EN010025,EN010027,EN010033,EN010005,EN010011,TR010002,TR010006,TR010007,TR010008,TR010009,TR010010,TR010014,TR010017,EN010123,EN020003,EN010061,EN010079,TR040011,TR050005,TR010036,EN010097,EN010101,EN010118,EN010127,EN010129,TR010024,TR010023,EN010088,TR010031,TR010030,EN010093,EN070005,TR010026,TR010035,TR010054,TR010043,EN010091,TR030006,TR030007,WS010005,EN010085,TR010027,TR050006,EN010008,EN010013,EN010020,EN010054,EN020014,EN020014,EN070007,TR050004,BC030001,EN020015,EN010046,TR010066,EN010114,EN010120,EN010131,EN010133,EN020024,TR010037,EN010164,TR010038,TR010040,TR010055,TR010034,EN010059,EN010062,EN010003,EN020008,EN020010,EN010112,BC080001,EN010015,EN010044,EN010072,EN010083,TR010039,EN010107,EN010026,TR010059,TR010056,EN010004,EN010092,TR010060,WW010001,EN010055,EN020016,EN010007,EN010090,TR010025,EN010049,TR010011,EN010001,TR010044,TR010062"
  back_office_integration_get_applications                              = "MERGE"
  client_affinity_enabled = true
  documents_host                                                        = "https://infrastructure.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_project_information                                     = "true"
  feature_allow_welsh_translation                                       = "true"
  feature_custom_folders                                                = "false"
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
  google_analytics_id                                                   = "G-DQ9S57CJDP"
  monitoring_config                    = {
    app_insights_web_test_enabled = true
  }
  national_infrastructure_gateway_ip                                    = "51.140.221.209"
  national_infrastructure_vnet_address_space                            = ["10.224.161.0/24", "192.168.0.0/20"]
  node_environment                                                      = "production"
  open_registration_case_references                                     = ""
  planned_outage_resume_text                                            = ""
  srv_notify_ip_registration_confirmation_email_to_ip_template_id       = "442ee953-7bd2-4b44-aa38-9dc8a3e42ab4"
  srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh = "b7559278-492b-4e4d-899c-484c03d05335"
  srv_notify_service_id                                                 = "2f25f917-c24f-44a6-9d0c-aebac7c98081"
  srv_notify_submission_complete_email_template_id                      = "47a18e22-7374-4a3a-8048-8f895e127b93"
  srv_notify_submission_complete_email_template_id_welsh                = "30f2da00-a82b-4435-aaf6-6178954d6405"
  srv_notify_subscription_create_email_template_id                      = "90437d7a-e153-4126-b65b-7ae36775fca2"
  srv_notify_subscription_create_email_template_id_welsh                = "6399f8d8-6684-4aff-bae9-6e4138a09cdf"
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
