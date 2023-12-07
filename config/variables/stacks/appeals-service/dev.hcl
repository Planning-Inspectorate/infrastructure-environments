locals {
  appeals_feature_flags = [
    {
      name    = "appeals-bo-submission"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["E69999999"]
      }
    },
    {
      name    = "enrol-users"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "final-comments"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["E69999999"]
      }
    },
    {
      name    = "has-questionnaire"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "horizon-document-labelling"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "lpa-dashboard"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "send-appeal-direct-to-horizon-wrapper"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    }
  ]
  allow_testing_overrides                                                     = true
  appeals_feature_back_office_subscriber_enabled                              = true
  deploy_interested_parties                                                   = true
  google_analytics_id                                                         = "G-HWLKLSJF53"
  google_tag_manager_id                                                       = "GTM-KZN7XP4"
  horizon_url                                                                 = "http://10.0.7.4:8000"
  node_environment                                                            = "development"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id    = "72f71441-12bf-4455-afbc-c58f9c72bfbd"
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id = "79488d5d-7efd-4273-a11f-e73f11d19676"
  srv_notify_appellant_login_confirm_registration_template_id                 = "f0781589-8df5-4717-ab87-1dc5c2d5a9de"
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id          = "799a27da-b640-4852-a070-e83ff54401f0"
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id       = "e3cba5d9-8b97-4922-97f1-48ef303b9195"
  srv_notify_save_and_return_continue_with_appeal_template_id                 = "b3651e9d-5cc3-4258-82b4-04ec2ba3d10e"
  srv_notify_save_and_return_enter_code_into_service_template_id              = "e509eee7-f0bd-4d63-9203-d598ddd5b31e"
  srv_notify_service_id                                                       = "c46d894e-d10e-4c46-a467-019576cd906a"
  srv_notify_start_email_to_lpa_template_id                                   = "c4701212-4b6a-4b55-801a-c86c7dbea54b"
  srv_notify_lpa_dashboard_invite_template_id                                 = "6726907e-d0f0-4e70-840e-196b38579de1"
  srv_notify_confirm_email_template_id                                        = "4156c7ac-a235-4577-b976-44020bec4d5f"
  srv_admin_monitoring_email                                                  = "AppealsBetaTeam@planninginspectorate.gov.uk"
  srv_notify_failure_to_upload_to_horizon_template_id                         = "49413491-90fd-4ce8-b061-e2f4758b636b"
  srv_notify_final_comment_submission_confirmation_email_template_id          = "d8919215-6688-408b-9781-eaf7af033605"
  sql_database_configuration = {
    max_size_gb                 = 2
    short_term_retention_days   = 7
    long_term_retention_weekly  = "P1W"
    long_term_retention_monthly = "P1M"
    long_term_retention_yearly  = "P1Y"
    long_term_week_of_year      = 1
    audit_retention_days        = 7
    sku_name                    = "Basic"
  }
  sql_server_azuread_administrator = {
    login_username = "sunrahman"
    object_id      = "2af5c723-b22e-4eac-b0e5-ec39675462d6"
  }
  task_submit_to_horizon_cron_string    = "*/10 * * * *"
  task_submit_to_horizon_trigger_active = "true"
}
