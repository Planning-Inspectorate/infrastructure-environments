locals {
  appeals_feature_flags = [
    {
      name    = "appeals-bo-submission"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
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
      enabled = false
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "has-appeal-form-v2"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["Q9999", "N5090"]
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
    },
    {
      name    = "serve-back-office-documents"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "sql-users"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "s78-appeal-form-v2"
      enabled = false
      targeting = {
        percentage = 100
        users      = ["Q9999"]
      }
    }
  ]
  allow_testing_overrides                                                       = false
  appeals_feature_back_office_subscriber_enabled                                = true
  appeals_frontend_file_upload_debug_logging_enabled                            = false
  comments_enabled                                                              = false
  dashboards_enabled                                                            = true
  rule_6_enabled                                                                = false
  deploy_interested_parties                                                     = true
  google_analytics_id                                                           = "G-DW8DW9TQ84"
  google_tag_manager_id                                                         = "GTM-KZN7XP4"
  horizon_url                                                                   = "http://10.224.161.68:8000"
  node_environment                                                              = "production"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id      = "27cddb5b-aa1e-453e-a511-f8eab31c3bb3"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id_v1_1 = "0068d142-8f16-4ec2-99a8-8cbb154439b9"
  srv_notify_has_appeal_submission_confirmation_email_to_appellant_template_id  = "a27fb17b-326e-4b7f-b819-fee4bae9f31e"
  srv_notify_full_appeal_submission_confirmation_email_to_appellant_template_id = "e977a1c3-4c0c-42b7-9606-b336e8c5a999"
  srv_notify_appeal_submission_notification_email_to_lpa_template_id            = "363bebac-340f-422c-941a-0e7b0a907583"
  srv_notify_appeal_received_notification_email_to_appellant_template_id        = "d5ca8e4d-9ccc-43e6-9e88-3ae8f2d84c88"
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id   = "b8c7a449-3bc1-4ce1-b07c-4e90f4bd9c17"
  srv_notify_appellant_login_confirm_registration_template_id                   = "c7e08c14-c45c-45e5-b0d1-460de0006215"
  srv_notify_start_email_to_lpa_template_id                                     = "22a6d662-3bbe-404f-8bca-c4b5c67ad346"
  srv_notify_lpa_dashboard_invite_template_id                                   = "762e0926-112f-4c71-b4fd-ad847aa1c63c"
  srv_notify_ip_comment_submission_confirmation_email_to_ip_template_id         = "96e74875-c919-4d02-98af-5bb746954079"
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id            = "d7535a2e-425c-4254-9f09-2b0eb460368c"
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id         = "3621ad01-9599-422e-b15c-903725261e6f"
  srv_notify_lpa_statement_submission_email_to_lpa_template_id                  = "2469c124-eca3-49ac-8206-4a9cfe74730e"
  srv_notify_lpa_final_comment_submission_email_to_lpa_template_id              = "b796c76d-2bfc-400e-a2d7-04d4c314f2e9"
  srv_notify_appellant_final_comment_submission_email_to_appellant_template_id  = "be8ba2f3-b8ae-4d63-93ea-4b1f725cd3a2"
  srv_notify_save_and_return_continue_with_appeal_template_id                   = "7ca79c5d-8842-4b36-9e82-d8ff4b65dbaa"
  srv_notify_save_and_return_enter_code_into_service_template_id                = "17fa62a6-81f6-49f7-87f0-b7a67d9ec5a0"
  srv_notify_service_id                                                         = "57ab0834-106d-438c-b0b9-3c8f2c268738"
  srv_notify_confirm_email_template_id                                          = "fef50c47-5ce4-4741-b89d-e31768b27bfd"
  srv_admin_monitoring_email                                                    = "appealsbetateam@planninginspectorate.gov.uk"
  srv_notify_failure_to_upload_to_horizon_template_id                           = "68fbc646-c4b4-4050-be04-1829a0b109dc"
  srv_notify_final_comment_submission_confirmation_email_template_id            = "be8ba2f3-b8ae-4d63-93ea-4b1f725cd3a2"
  sql_database_configuration = {
    max_size_gb                 = 250
    short_term_retention_days   = 30
    long_term_retention_weekly  = "P1W"
    long_term_retention_monthly = "P1M"
    long_term_retention_yearly  = "P1Y"
    long_term_week_of_year      = 1
    audit_retention_days        = 120
    sku_name                    = "S0"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-prod-appeals-fo"
    object_id      = "5be54d58-1179-41c4-8687-1a06eec6d153"
  }
  task_submit_to_horizon_cron_string    = "*/15 * * * *"
  task_submit_to_horizon_trigger_active = "true"
}
