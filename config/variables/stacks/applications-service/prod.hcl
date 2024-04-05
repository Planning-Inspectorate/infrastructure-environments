locals {
  activate_planned_outage                                         = "false"
  back_office_integration_case_references                         = "EN0710001"
  back_office_integration_get_applications                        = "MERGE"
  documents_host                                                  = "https://infrastructure.planninginspectorate.gov.uk/wp-content/ipc/uploads/projects/"
  feature_allow_document_library                                  = "true"
  feature_allow_examination_timetable                             = "true"
  feature_allow_get_updates                                       = "true"
  feature_allow_have_your_say                                     = "true"
  feature_allow_project_information                               = "true"
  feature_allow_representation                                    = "true"
  feature_allow_section_51                                        = "true"
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
  open_registration_case_references                               = "TR010063"
  planned_outage_resume_text                                      = ""
  private_beta_v1_routes_only                                     = "false"
  project_migration_case_references                               = "BC010001,EN010001,EN010003,EN010005,EN010011,EN010012,EN010016,EN010021,EN010024,EN010025,EN010026,EN010027,EN010032,EN010033,EN010034,EN010036,EN010038,EN010039,EN010048,EN010050,EN010051,EN010053,EN010056,EN010058,EN010060,EN010061,EN010064,EN010068,EN010071,EN010074,EN010077,EN010078,EN010079,EN010080,EN010081,EN010082,EN010083,EN010084,EN010085,EN010087,EN010088,EN010090,EN010091,EN010092,EN010093,EN010095,EN010097,EN010098,EN010099,EN010101,EN010107,EN010111,EN010114,EN010115,EN010117,EN010118,EN010119,EN010120,EN010121,EN010122,EN010125,EN010126,EN010128,EN010129,EN010130,EN010135,EN010136,EN010138,EN010139,EN010140,EN010141,EN010142,EN010143,EN010144,EN010147,EN010148,EN010149,EN010150,EN010151,EN010152,EN010153,EN010154,EN010155,EN010157,EN010158,EN010159,EN010161,EN010162,EN010164,EN020001,EN020003,EN020009,EN020017,EN020019,EN020021,EN020023,EN020025,EN020026,EN020027,EN020032,EN020033,EN020034,EN030001,EN030002,EN030003,EN060001,EN060004,EN060006,EN070001,EN070003,EN070008,EN070009,TR010002,TR010006,TR010007,TR010008,TR010009,TR010010,TR010011,TR010014,TR010015,TR010016,TR010017,TR010018,TR010019,TR010020,TR010021,TR010022,TR010023,TR010024,TR010026,TR010027,TR010029,TR010030,TR010031,TR010033,TR010034,TR010035,TR010036,TR010037,TR010038,TR010039,TR010040,TR010044,TR010045,TR010054,TR010056,TR010060,TR010061,TR010063,TR010064,TR010065,TR010066,TR020003,TR020004,TR030002,TR030003,TR030004,TR030008,TR040001,TR040002,TR040004,TR040005,TR040009,TR040010,TR040011,TR040012,TR050001,TR050002,TR050003,TR050005,TR050006,TR050008,TR050009,WA010002,WA010003,WA010004,WA010005,WA020001,WS010001,WS010002,WS010003,WS010004,WS010005,WW010001,WW010003,EN010133,EN010106,EN070005,TR010025,TR010043,TR020002,TR020005,EN010132,EN010131,TR030007,TR020001,EN020024,TR050007,EN010123,TR010032,TR010055,EN010127,EN020022,TR010059,EN010116,TR010062,EN010110,EN020002,EN010102,TR030006,TR030005,EN070006,BC030001,TR050004,BC080001,EN010109,EN010170,EN010169,EN020036,WA010006,TR030001,EN040001,EN010163,EN010168,EN010165,EN010103"
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
    login_username = "sunrahman"
    object_id      = "2af5c723-b22e-4eac-b0e5-ec39675462d6"
  }
}
