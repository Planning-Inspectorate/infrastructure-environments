locals {
  appeals_feature_flags = [
    {
      name    = "final-comments"
      enabled = false
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
      name    = "send-appeal-direct-to-horizon-wrapper"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    }
  ]
  google_analytics_id                                                         = "G-DW8DW9TQ84"
  google_tag_manager_id                                                       = "GTM-KZN7XP4"
  horizon_url                                                                 = "http://10.224.161.68:8000"
  node_environment                                                            = "production"
  srv_notify_appeal_submission_confirmation_email_to_appellant_template_id    = "27cddb5b-aa1e-453e-a511-f8eab31c3bb3"
  srv_notify_appeal_submission_received_notification_email_to_lpa_template_id = "b8c7a449-3bc1-4ce1-b07c-4e90f4bd9c17"
  srv_notify_start_email_to_lpa_template_id                                   = "22a6d662-3bbe-404f-8bca-c4b5c67ad346"
  srv_notify_full_appeal_confirmation_email_to_appellant_template_id          = "d7535a2e-425c-4254-9f09-2b0eb460368c"
  srv_notify_full_appeal_received_notification_email_to_lpa_template_id       = "3621ad01-9599-422e-b15c-903725261e6f"
  srv_notify_save_and_return_continue_with_appeal_template_id                 = "7ca79c5d-8842-4b36-9e82-d8ff4b65dbaa"
  srv_notify_save_and_return_enter_code_into_service_template_id              = "17fa62a6-81f6-49f7-87f0-b7a67d9ec5a0"
  srv_notify_service_id                                                       = "57ab0834-106d-438c-b0b9-3c8f2c268738"
  srv_notify_confirm_email_template_id                                        = "fef50c47-5ce4-4741-b89d-e31768b27bfd"
  srv_admin_monitoring_email                                                  = "appealsbetateam@planninginspectorate.gov.uk"
  srv_notify_failure_to_upload_to_horizon_template_id                         = "68fbc646-c4b4-4050-be04-1829a0b109dc"
  task_submit_to_horizon_cron_string                                          = "*/15 * * * *"
  task_submit_to_horizon_trigger_active                                       = "true"
}
