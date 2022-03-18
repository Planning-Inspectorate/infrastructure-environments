include {
  path = "../../../../config/terragrunt.hcl"
}

# dependency "appeals_service_uks" {
#   config_path                             = "../../uk-south/appeals-service"
#   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
#   mock_outputs_merge_with_state           = true

#   mock_outputs = {
#     app_service_urls = {
#       appeals_frontend_uks = "mock-wfe-url"
#     }
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
#   }
# }

dependency "applications_service_uks" {
  config_path                             = "../../uk-south/applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      applications_frontend_uks = "mock-wfe-url"
    }
  }
}

dependency "applications_service_ukw" {
  config_path                             = "../../uk-west/applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      applications_frontend_ukw = "mock-wfe-url"
    }
  }
}

inputs = {
  app_service_urls = merge(
    # dependency.appeals_service_uks.outputs.app_service_urls,
    # dependency.appeals_service_ukw.outputs.app_service_urls,

    dependency.applications_service_uks.outputs.app_service_urls,
    dependency.applications_service_ukw.outputs.app_service_urls
  )
}
