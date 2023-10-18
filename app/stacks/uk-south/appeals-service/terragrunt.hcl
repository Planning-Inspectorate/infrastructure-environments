include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "appeals_service_ukw" {
  config_path                             = "../../uk-west/appeals-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    appeal_documents_primary_blob_connection_string = "mock_connection_string"
    appeal_documents_storage_container_name         = "mock_container_name"
    cosmosdb_connection_string                      = "mock_connection_string"
    cosmosdb_id                                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    function_apps_storage_account                   = "mockstorageaccount"
    function_apps_storage_account_access_key        = "mockaccesskey"
  }
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_plan_id                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    common_resource_group_name                = "mock_resource_group_name"
    integration_functions_app_service_plan_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    common_vnet_cidr_blocks = {
      app_service_integration   = "10.1.1.0/24"
      appeals_service_endpoints = "10.1.2.0/24"
      cosmosdb_endpoint         = "10.1.3.1/25"
    }
    common_vnet_gateway_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworkGateways/mock_id"
    common_vnet_name                       = "mock_vnet_name"
    cosmosdb_subnet_id                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    integration_subnet_id                  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    common_integration_functions_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue/subnets/subnetValue"
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
dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_frontend_ukw         = "mock-wfe-url"
      back_office_appeals_frontend_ukw = "mock-wfe-url"
    }
    appeals_web_frontend_url                                = "mock-appeals-wfe-url"
    clamav_host                                             = "clam.dev"
    service_bus_appeals_bo_case_topic_id                    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_appeals_fo_lpa_response_submission_topic_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_appeals_bo_document_topic_id                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_listed_building_topic_id                    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
  }
}


inputs = {
  action_group_low_id                                     = dependency.common_ukw.outputs.action_group_low_id
  app_service_plan_id                                     = try(dependency.common_uks.outputs.app_service_plan_id, null)
  appeal_documents_primary_blob_connection_string         = dependency.appeals_service_ukw.outputs.appeal_documents_primary_blob_connection_string
  appeal_documents_storage_container_name                 = dependency.appeals_service_ukw.outputs.appeal_documents_storage_container_name
  back_office_service_bus_namespace_name                  = dependency.back_office_ukw.outputs.service_bus_namespace_name
  service_bus_appeals_bo_case_topic_id                    = dependency.back_office_ukw.outputs.service_bus_appeals_bo_case_topic_id
  service_bus_appeals_fo_lpa_response_submission_topic_id = dependency.back_office_ukw.outputs.service_bus_appeals_fo_lpa_response_submission_topic_id
  service_bus_appeals_bo_document_topic_id                = dependency.back_office_ukw.outputs.service_bus_appeals_bo_document_topic_id
  service_bus_listed_building_topic_id                    = dependency.back_office_ukw.outputs.service_bus_listed_building_topic_id
  common_integration_functions_subnet_id                  = dependency.common_uks.outputs.integration_subnet_id
  common_resource_group_name                              = dependency.common_uks.outputs.common_resource_group_name
  common_vnet_cidr_blocks                                 = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_name                                        = dependency.common_uks.outputs.common_vnet_name
  cosmosdb_connection_string                              = dependency.appeals_service_ukw.outputs.cosmosdb_connection_string
  cosmosdb_id                                             = dependency.appeals_service_ukw.outputs.cosmosdb_id
  cosmosdb_subnet_id                                      = try(dependency.common_uks.outputs.cosmosdb_subnet_id, null)
  function_apps_storage_account                           = dependency.appeals_service_ukw.outputs.function_apps_storage_account
  function_apps_storage_account_access_key                = dependency.appeals_service_ukw.outputs.function_apps_storage_account_access_key
  integration_functions_app_service_plan_id               = try(dependency.common_uks.outputs.integration_functions_app_service_plan_id, null)
  integration_subnet_id                                   = try(dependency.common_uks.outputs.integration_subnet_id, null)
  key_vault_id                                            = dependency.common_ukw.outputs.key_vault_id
  key_vault_uri                                           = dependency.common_ukw.outputs.key_vault_uri
  clamav_host                                             = dependency.back_office_ukw.outputs.clamav_host
}
