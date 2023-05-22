locals {
  appeals_feature_flags = [
    {
      name    = "final-comments"
      enabled = true
      targeting = {
        percentage = 100
        users      = ["E69999999"]
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
      name    = "send-appeal-direct-to-horizon-wrapper"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    }
  ]
  google_analytics_id                                                         = "G-HWLKLSJF53"
  google_tag_manager_id                                                       = "GTM-KZN7XP4"
  horizon_url                                                                 = "http://10.0.7.4:8000"
  node_environment                                                            = "development"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id    = "72f71441-12bf-4455-afbc-c58f9c72bfbd"
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id = "79488d5d-7efd-4273-a11f-e73f11d19676"
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id          = "799a27da-b640-4852-a070-e83ff54401f0"
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id       = "e3cba5d9-8b97-4922-97f1-48ef303b9195"
  srv_notify_save_and_return_continue_with_appeal_template_id                 = "b3651e9d-5cc3-4258-82b4-04ec2ba3d10e"
  srv_notify_save_and_return_enter_code_into_service_template_id              = "e509eee7-f0bd-4d63-9203-d598ddd5b31e"
  srv_notify_service_id                                                       = "c46d894e-d10e-4c46-a467-019576cd906a"
  srv_notify_start_email_to_lpa_template_id                                   = "c4701212-4b6a-4b55-801a-c86c7dbea54b"
  srv_notify_confirm_email_template_id                                        = "4156c7ac-a235-4577-b976-44020bec4d5f"
  srv_admin_monitoring_email                                                  = "AppealsBetaTeam@planninginspectorate.gov.uk"
  srv_notify_failure_to_upload_to_horizon_template_id                         = "49413491-90fd-4ce8-b061-e2f4758b636b"
  task_submit_to_horizon_cron_string                                          = "*/10 * * * *"
  task_submit_to_horizon_trigger_active                                       = "true"
  allow_testing_overrides                                                     = true
}
