include {
  path = "../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_insights_connection_string   = "mock_connection_string"
    app_insights_instrumentation_key = "mock_instrumentation_key"
    app_service_plan_id              = "mock_id"
    common_network_name              = "mock_network_name"
    common_resource_group_name       = "mock_resource_group_name"
    integration_subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    private_dns_zone_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/privateDnsZones/mock_id"
  }
}

inputs = {
  app_insights_connection_string   = dependency.common.outputs.app_insights_connection_string
  app_insights_instrumentation_key = dependency.common.outputs.app_insights_instrumentation_key
  app_service_plan_id              = dependency.common.outputs.app_service_plan_id
  common_network_name              = dependency.common.outputs.common_network_name
  common_resource_group_name       = dependency.common.outputs.common_resource_group_name
  integration_subnet_id            = dependency.common.outputs.integration_subnet_id
  private_dns_zone_id              = dependency.common.outputs.private_dns_zone_id
}
