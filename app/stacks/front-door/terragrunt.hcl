include {
  path = "../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    common_resource_group_name = "mock_resource_group_name"
  }
}

dependency "appeals_service" {
  config_path                             = "../appeals-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      appeals_service_frontend = "mock_url"
      # lpa_questionnaire_frontend = "mock_url"
    }
  }
}

dependency "applications_service" {
  config_path                             = "../applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      national_infrastructure_frontend = "mock_url"
    }
  }
}

inputs = {
  app_service_urls = merge(
    dependency.applications_service.outputs.app_service_urls,
    dependency.appeals_service.outputs.app_service_urls
  )
  common_resource_group_name = dependency.common.outputs.common_resource_group_name
}
