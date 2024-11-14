locals {
  appeals_feature_flags = [
    {
      name    = "appeals-bo-submission"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["Q9999"]
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
      name    = "has-appeal-form-v2"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["Q9999"]
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
      enabled = true
      targeting = {
        percentage = 100
        users      = ["Q9999"]
      }
    }
  ]
  allow_testing_overrides                                                       = true
  appeals_feature_back_office_subscriber_enabled                                = true
  comments_enabled                                                              = true
  dashboards_enabled                                                            = true
  rule_6_enabled                                                                = true
  deploy_interested_parties                                                     = true
  google_analytics_id                                                           = "G-HWLKLSJF53"
  google_tag_manager_id                                                         = "GTM-KZN7XP4"
  horizon_url                                                                   = "http://10.0.7.4:8000"
  node_environment                                                              = "production"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id      = "72f71441-12bf-4455-afbc-c58f9c72bfbd"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id_v1_1 = "72f71441-12bf-4455-afbc-c58f9c72bfbd"
  srv_notify_has_appeal_submission_confirmation_email_to_appellant_template_id  = "d236fbb1-172e-4596-adf0-dc9bcf01aefd"
  srv_notify_full_appeal_submission_confirmation_email_to_appellant_template_id = "e52c2bb2-fe02-4399-b1cf-2bdfaeef6334"
  srv_notify_appeal_submission_notification_email_to_lpa_template_id            = "a46a8408-9e04-435f-9588-6017dff8eb16"
  srv_notify_appeal_received_notification_email_to_appellant_template_id        = "13dbf9e9-7549-4973-9c70-9fb9d67e38e7"
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id   = "79488d5d-7efd-4273-a11f-e73f11d19676"
  srv_notify_appellant_login_confirm_registration_template_id                   = "f0781589-8df5-4717-ab87-1dc5c2d5a9de"
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id            = "799a27da-b640-4852-a070-e83ff54401f0"
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id         = "e3cba5d9-8b97-4922-97f1-48ef303b9195"
  srv_notify_lpa_statement_submission_email_to_lpa_template_id                  = "8453071b-7b7b-4f93-a482-7a24847d8809"
  srv_notify_lpa_final_comment_submission_email_to_lpa_template_id              = "b0893523-821d-437b-9fbe-11c5e5146c27"
  srv_notify_lpa_proof_evidence_submission_email_to_lpa_template_id             = "7ff0a165-7d5e-4dae-9dc3-e55b936f2147"
  srv_notify_appellant_final_comment_submission_email_to_appellant_template_id  = "5f37a34b-d351-4465-80f9-7abc98eeada8"
  srv_notify_appellant_proof_evidence_submission_email_to_appellant_template_id = "6434b364-5ac9-48b5-9fa0-3bfca2f63f55"
  srv_notify_rule_6_proof_evidence_submission_email_to_rule_6_party_template_id = "1df1f75e-8414-4dd1-877f-a7b8f79edf63"
  srv_notify_rule_6_statement_submission_email_to_rule_6_party_template_id      = "23fe17dd-3974-4404-8839-3f7b1e8b9430"
  srv_notify_save_and_return_continue_with_appeal_template_id                   = "b3651e9d-5cc3-4258-82b4-04ec2ba3d10e"
  srv_notify_save_and_return_enter_code_into_service_template_id                = "e509eee7-f0bd-4d63-9203-d598ddd5b31e"
  srv_notify_service_id                                                         = "c46d894e-d10e-4c46-a467-019576cd906a"
  srv_notify_start_email_to_lpa_template_id                                     = "c4701212-4b6a-4b55-801a-c86c7dbea54b"
  srv_notify_lpa_dashboard_invite_template_id                                   = "6726907e-d0f0-4e70-840e-196b38579de1"
  srv_notify_ip_comment_submission_confirmation_email_to_ip_template_id         = "2d7b8443-5336-4285-9462-fc7b039a36d3"
  srv_notify_confirm_email_template_id                                          = "4156c7ac-a235-4577-b976-44020bec4d5f"
  srv_admin_monitoring_email                                                    = "AppealsBetaTeam@planninginspectorate.gov.uk"
  srv_notify_failure_to_upload_to_horizon_template_id                           = "49413491-90fd-4ce8-b061-e2f4758b636b"
  srv_notify_final_comment_submission_confirmation_email_template_id            = "d8919215-6688-408b-9781-eaf7af033605"
  sql_database_configuration = {
    max_size_gb                 = 250
    short_term_retention_days   = 7
    long_term_retention_weekly  = "P1W"
    long_term_retention_monthly = "P1M"
    long_term_retention_yearly  = "P1Y"
    long_term_week_of_year      = 1
    audit_retention_days        = 30
    sku_name                    = "S0"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-test-appeals-fo"
    object_id      = "66a06b64-4cbb-4252-a79f-0b491dcd9d9c"
  }
  task_submit_to_horizon_cron_string    = "*/10 * * * *"
  task_submit_to_horizon_trigger_active = "true"
}
