include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_plan_id                         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    applications_service_vpn_gateway_shared_key = "mock_shared_key"
    common_resource_group_name                  = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      appeals_service_endpoints = "10.1.2.0/24"
    }
    common_vnet_gateway_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworkGateways/mock_id"
    common_vnet_name       = "mock_vnet_name"
    integration_subnet_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
  }
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_low_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri       = "https://mockvault.vault.azure.net/"
  }
}

inputs = {
  action_group_low_id                         = dependency.common_ukw.outputs.action_group_low_id
  app_service_plan_id                         = try(dependency.common_uks.outputs.app_service_plan_id, null)
  applications_service_vpn_gateway_shared_key = dependency.common_uks.outputs.applications_service_vpn_gateway_shared_key
  common_resource_group_name                  = dependency.common_uks.outputs.common_resource_group_name
  common_vnet_cidr_blocks                     = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id                      = try(dependency.common_uks.outputs.common_vnet_gateway_id, null)
  common_vnet_name                            = dependency.common_uks.outputs.common_vnet_name
  integration_subnet_id                       = dependency.common_uks.outputs.integration_subnet_id
  key_vault_id                                = dependency.common_ukw.outputs.key_vault_id
  key_vault_uri                               = dependency.common_ukw.outputs.key_vault_uri
}
