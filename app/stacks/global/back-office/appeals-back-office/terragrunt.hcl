include {
  path = "../../../../../config/terragrunt.hcl"
}

# dependency "appeals_service_uks" {
#   config_path                             = "../../uk-south/appeals-service"
#   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
#   mock_outputs_merge_with_state           = true

#   mock_outputs = {
#     app_service_urls = {
#       appeals_frontend_uks = "mock-wfe-url"
#     }
#     web_comment_frontend_url = "mock-wfe-url"
#   }
# }


# dependency "appeals_service_ukw" {
#   config_path                             = "../../uk-west/appeals-service"
#   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
#   mock_outputs_merge_with_state           = true

#   mock_outputs = {
#     app_service_urls = {
#       appeals_frontend_ukw = "mock-wfe-url"
#     }
#     web_comment_frontend_url = "mock-wfe-url"
#   }
# }

dependency "appeals_back_office_uks" {
  config_path                             = "../../uk-south/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_appeals_frontend_uks = "mock-wfe-url"
    }
    # appeals_web_frontend_url = "mock-appeals-wfe-url"
  }
}

dependency "appeals_back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_appeals_frontend_ukw = "mock-wfe-url"
    }
    # appeals_web_frontend_url = "mock-appeals-wfe-url"
  }
}

inputs = {
  # appeals_service_primary_app_service_url           = dependency.appeals_service_ukw.outputs.web_frontend_url
  # appeals_service_secondary_app_service_url         = dependency.appeals_service_uks.outputs.web_frontend_url
  back_office_appeals_primary_app_service_url   = dependency.appeals_back_office_ukw.outputs.appeals_web_frontend_url
  back_office_appeals_secondary_app_service_url = dependency.appeals_back_office_uks.outputs.appeals_web_frontend_url
  common_log_analytics_workspace_id             = dependency.common_ukw.outputs.log_analytics_workspace_id
}
