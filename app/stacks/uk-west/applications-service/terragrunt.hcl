include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    applications_service_vpn_gateway_shared_key = "mock_shared_key"
    key_vault_id                                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"

    key_vault_secret_refs = {
      applications-service-encryption-secret-key = "mock_secret"
      applications-service-mysql-database        = "mock_secret"
      applications-service-mysql-dialect         = "mock_secret"
      applications-service-mysql-host            = "mock_secret"
      applications-service-mysql-password        = "mock_secret"
      applications-service-mysql-port            = "mock_secret"
      applications-service-mysql-username        = "mock_secret"
      srv-notify-api-key                         = "mock_secret"
    }
  }
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "mock_id"
    common_resource_group_name       = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      app_gateway                    = "10.1.0.0/25"
      app_service_integration        = "10.1.1.0/24"
      appeals_service_endpoints      = "10.1.2.0/24"
      applications_service_endpoints = "10.1.3.0/24"
      vpn_gateway                    = "10.1.0.128/25"
    }
    common_vnet_gateway_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworkGateways/mock_id"
    common_vnet_name       = "mock_vnet_name"
    integration_subnet_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
  }
}

inputs = {
  app_insights_connection_string              = try(dependency.common_ukw.outputs.app_insights_connection_string, null)
  app_insights_instrumentation_key            = try(dependency.common_ukw.outputs.app_insights_instrumentation_key, null)
  app_service_plan_id                         = try(dependency.common_ukw.outputs.app_service_plan_id, null)
  applications_service_vpn_gateway_shared_key = dependency.common_uks.outputs.applications_service_vpn_gateway_shared_key
  common_resource_group_name                  = dependency.common_ukw.outputs.common_resource_group_name
  common_vnet_cidr_blocks                     = dependency.common_ukw.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id                      = dependency.common_ukw.outputs.common_vnet_gateway_id
  common_vnet_name                            = dependency.common_ukw.outputs.common_vnet_name
  integration_subnet_id                       = dependency.common_ukw.outputs.integration_subnet_id
  key_vault_id                                = dependency.common_uks.outputs.key_vault_id
  key_vault_secret_refs                       = dependency.common_uks.outputs.key_vault_secret_refs
}
