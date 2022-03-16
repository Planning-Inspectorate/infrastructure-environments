include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "appeals_service_uks" {
  config_path                             = "../../uk-south/appeals-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    cosmosdb_connection_string                       = "mock_connection_string"
    function_apps_storage_account                    = "mockstorageaccount"
    function_apps_storage_account_primary_access_key = "mock_key"
  }
}

dependency "common_uks" {
  config_path                             = "../../uk-south/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    key_vault_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"

    key_vault_secret_refs = {
      srv-notify-api-key = "mock_secret"
    }
  }
}

dependency "common_ukw" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "mock_id"
    common_resource_group_name       = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      appeals_service_endpoints = "10.1.2.0/24"
    }
    common_vnet_gateway_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworkGateways/mock_id"
    common_vnet_name       = "mock_vnet_name"
    integration_subnet_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
  }
}

inputs = {
  app_insights_connection_string                   = try(dependency.common_ukw.outputs.app_insights_connection_string, null)
  app_insights_instrumentation_key                 = try(dependency.common_ukw.outputs.app_insights_instrumentation_key, null)
  app_service_plan_id                              = try(dependency.common_ukw.outputs.app_service_plan_id, null)
  common_resource_group_name                       = dependency.common_ukw.outputs.common_resource_group_name
  common_vnet_cidr_blocks                          = dependency.common_ukw.outputs.common_vnet_cidr_blocks
  common_vnet_name                                 = dependency.common_ukw.outputs.common_vnet_name
  cosmosdb_connection_string                       = dependency.appeals_service_uks.outputs.cosmosdb_connection_string
  function_apps_storage_account                    = dependency.appeals_service_uks.outputs.function_apps_storage_account
  function_apps_storage_account_primary_access_key = dependency.appeals_service_uks.outputs.function_apps_storage_account_primary_access_key
  integration_subnet_id                            = dependency.common_ukw.outputs.integration_subnet_id
  key_vault_id                                     = dependency.common_uks.outputs.key_vault_id
  key_vault_secret_refs                            = dependency.common_uks.outputs.key_vault_secret_refs
}
