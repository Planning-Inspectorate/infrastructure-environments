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

dependency "applications-service" {
  config_path                             = "../applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    ni_frontend_url = "mock-app-service.azurewebsites.net"
  }
}

inputs = {
  common_resource_group_name = dependency.common.outputs.common_resource_group_name
  ni_frontend_url            = dependency.applications-service.outputs.ni_frontend_url
}
