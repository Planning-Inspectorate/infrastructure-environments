include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    common_resource_group_name = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    common_vnet_name = "mock_vnet_name"
  }
}

inputs = {
  common_resource_group_name = dependency.common.outputs.common_resource_group_name
  common_vnet_cidr_blocks    = dependency.common.outputs.common_vnet_cidr_blocks
  common_vnet_name           = dependency.common.outputs.common_vnet_name
}
