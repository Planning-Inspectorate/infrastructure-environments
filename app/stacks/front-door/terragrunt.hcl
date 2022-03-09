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

dependency "applications_service" {
  config_path                             = "../applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      mock_app_service = "mock_url"
    }
  }
}

inputs = {
  app_service_urls           = dependency.applications_service.outputs.app_service_urls
  common_resource_group_name = dependency.common.outputs.common_resource_group_name
}
