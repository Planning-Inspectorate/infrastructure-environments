include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    applications_service_vpn_gateway_shared_key = "mock-key"
    sql_server_password                         = "mockuser"
    sql_server_username                         = "mockpass"
  }
}

inputs = {
  applications_service_vpn_gateway_shared_key = dependency.common_ukw.outputs.applications_service_vpn_gateway_shared_key
  sql_server_password                         = dependency.common_ukw.outputs.sql_server_password
  sql_server_username                         = dependency.common_ukw.outputs.sql_server_username
}
