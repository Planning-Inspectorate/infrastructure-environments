include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../../uk-south/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    applications_service_vpn_gateway_shared_key = "mock-key"
  }
}

inputs = {
  applications_service_vpn_gateway_shared_key = dependency.common_uks.outputs.applications_service_vpn_gateway_shared_key
}
