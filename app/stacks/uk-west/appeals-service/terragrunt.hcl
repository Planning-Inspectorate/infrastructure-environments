include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_ukw" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_low_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    app_service_plan_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    common_resource_group_name = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      app_service_integration   = "10.1.1.0/24"
      appeals_service_endpoints = "10.1.2.0/24"
      cosmosdb_endpoint         = "10.1.3.1/25"
    }
    common_vnet_name      = "mock_vnet_name"
    cosmosdb_subnet_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    key_vault_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri         = "https://mockvault.vault.azure.net/"
  }
}

dependency "back_office_ukw" {
  config_path                             = "../back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    service_bus_namespace_name                     = "mock-namespace"
    service_bus_nsip_project_topic_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_documents_topic_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    servicebus_topic_register_nsip_subscription_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_project_update_topic_id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    clamav_host                                    = "clam.dev"
  }
}

inputs = {
  action_group_low_id        = dependency.common_ukw.outputs.action_group_low_id
  app_service_plan_id        = dependency.common_ukw.outputs.app_service_plan_id
  common_resource_group_name = dependency.common_ukw.outputs.common_resource_group_name
  common_vnet_cidr_blocks    = dependency.common_ukw.outputs.common_vnet_cidr_blocks
  common_vnet_name           = dependency.common_ukw.outputs.common_vnet_name
  cosmosdb_subnet_id         = try(dependency.common_ukw.outputs.cosmosdb_subnet_id, null)
  integration_subnet_id      = dependency.common_ukw.outputs.integration_subnet_id
  key_vault_id               = dependency.common_ukw.outputs.key_vault_id
  key_vault_uri              = dependency.common_ukw.outputs.key_vault_uri
  clamav_host                = dependency.back_office_ukw.outputs.clamav_host
}
