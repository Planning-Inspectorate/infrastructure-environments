include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    common_resource_group_name = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      app_gateway                    = "10.1.0.0/25"
      app_service_integration        = "10.1.1.0/24"
      appeals_service_endpoints      = "10.1.2.0/24"
      applications_service_endpoints = "10.1.3.0/24"
      back_office_endpoints          = "10.1.4.0/24"
      vpn_gateway                    = "10.1.0.128/25"
    }
    common_vnet_name = "mock_vnet_name"
  }
}

inputs = {
  common_resource_group_name = dependency.common_uks.outputs.common_resource_group_name
  common_vnet_cidr_blocks    = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_name           = dependency.common_uks.outputs.common_vnet_name
}
