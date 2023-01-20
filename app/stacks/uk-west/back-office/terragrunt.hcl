include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_low_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    app_service_plan_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    back_office_integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock_resource_group/mock/mock_id"
    back_office_clamav_subnet_id      = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock_resource_group/mock/mock_id"
    common_resource_group_name        = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    vnet_id               = "mock_vnet_id"
    common_vnet_name      = "mock_vnet_name"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    key_vault_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri         = "https://mockvault.vault.azure.net/"
  }
}

inputs = {
  action_group_low_id               = dependency.common.outputs.action_group_low_id
  app_service_plan_id               = dependency.common.outputs.app_service_plan_id
  back_office_integration_subnet_id = dependency.common.outputs.back_office_integration_subnet_id
  back_office_clamav_subnet_id      = dependency.common.outputs.back_office_clamav_subnet_id
  common_resource_group_name        = dependency.common.outputs.common_resource_group_name
  common_vnet_cidr_blocks           = dependency.common.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id            = dependency.common.outputs.common_vnet_gateway_id
  common_vnet_id                    = dependency.common.outputs.vnet_id
  common_vnet_name                  = dependency.common.outputs.common_vnet_name
  integration_subnet_id             = dependency.common.outputs.integration_subnet_id
  key_vault_uri                     = dependency.common.outputs.key_vault_uri
  key_vault_id                      = dependency.common.outputs.key_vault_id
}
