include {
  path = "../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "mock_id"
  }
}

inputs = {
  app_insights_connection_string   = dependency.common.outputs.app_insights_connection_string
  app_insights_instrumentation_key = dependency.common.outputs.app_insights_instrumentation_key
  app_service_plan_id              = dependency.common.outputs.app_service_plan_id
}
