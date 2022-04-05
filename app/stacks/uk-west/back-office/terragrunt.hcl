include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_low_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    common_resource_group_name       = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    common_vnet_name      = "mock_vnet_name"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    key_vault_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    sql_server_primary_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_db"
  }
}

dependency "common_uks" {
  config_path                             = "../../uk-south/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    sql_server_failover_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_db"
  }
}

inputs = {
  action_group_low_id              = dependency.common.outputs.action_group_low_id
  app_insights_connection_string   = dependency.common.outputs.app_insights_connection_string
  app_insights_instrumentation_key = dependency.common.outputs.app_insights_instrumentation_key
  app_service_plan_id              = dependency.common.outputs.app_service_plan_id
  common_resource_group_name       = dependency.common.outputs.common_resource_group_name
  common_vnet_cidr_blocks          = dependency.common.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id           = dependency.common.outputs.common_vnet_gateway_id
  common_vnet_name                 = dependency.common.outputs.common_vnet_name
  integration_subnet_id            = dependency.common.outputs.integration_subnet_id
  key_vault_id                     = dependency.common.outputs.key_vault_id
  sql_server_failover_id           = dependency.common_uks.outputs.sql_server_id
  sql_server_primary_id            = dependency.common.outputs.sql_server_id
}
