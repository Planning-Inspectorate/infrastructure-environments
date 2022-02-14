include {
  path = "${get_path_to_repo_root()}/config/terragrunt.hcl"
}

dependency "base" {
  config_path                             = "../base"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_plan_id       = "mock_id"
    cosmodb_connection_string = "mock_connection_string"
  }
}

inputs = {
  app_service_plan_id = dependency.base.outputs.app_service_plan_id
  mongodb_url         = dependency.base.outputs.cosmodb_connection_string
}
