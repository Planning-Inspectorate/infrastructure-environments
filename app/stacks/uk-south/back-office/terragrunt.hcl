include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    common_resource_group_name       = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    common_vnet_name      = "mock_vnet_name"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
  }
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_low_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    sql_server_password = "mockuser"
    sql_server_username = "mockpass"
  }
}

dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs {
    back_office_sql_database = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server/databases/mock_sql_db"
    primary_sql_server_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server"
  }
}

inputs = {
  action_group_low_id              = dependency.common_ukw.outputs.action_group_low_id
  app_insights_connection_string   = try(dependency.common_uks.outputs.app_insights_connection_string, null)
  app_insights_instrumentation_key = try(dependency.common_uks.outputs.app_insights_instrumentation_key, null)
  app_service_plan_id              = try(dependency.common_uks.outputs.app_service_plan_id, null)
  back_office_sql_database         = dependency.back_office_ukw.outputs.back_office_sql_database
  common_resource_group_name       = dependency.common_uks.outputs.common_resource_group_name
  common_vnet_cidr_blocks          = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_name                 = dependency.common_uks.outputs.common_vnet_name
  integration_subnet_id            = dependency.common_uks.outputs.integration_subnet_id
  key_vault_id                     = dependency.common_ukw.outputs.key_vault_id
  primary_sql_server_id            = dependency.back_office_ukw.outputs.sql_server_id
  sql_server_password              = dependency.common_ukw.outputs.sql_server_password
  sql_server_username              = dependency.common_ukw.outputs.sql_server_username
}
