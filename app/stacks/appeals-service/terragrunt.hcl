include {
  path = "../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_plan_id = "mock_id"
  }
}

inputs = {
  app_service_plan_id = dependency.common.outputs.app_service_plan_id
}
