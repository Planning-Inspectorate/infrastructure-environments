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

dependency "applications_service_ukw" {
  config_path                             = "../../uk-west/applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    function_storage_name                = "mock-storage-name"
    function_storage_primary_access_key  = "mock-storage-key"
    primary_applications_sql_server_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server"
    primary_applications_sql_database_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server/databases/mock_sql_db"
  }
}

# TODO: ASB-1171 - uncomment when service bus in back office uks set up
#dependency "back_office_uks" {
#  config_path                             = "../../uk-south/back-office"
#  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
#  mock_outputs_merge_with_state           = true
#
#  mock_outputs = {
#    back_office_submissions_storage_container_name                 = "mock-name"
#    back_office_submissions_storage_container_resource_manager_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Storage/storageAccounts/mock-account/blobServices/default/containers/mock-container"
#    back_office_document_storage_account_name                      = "mock-name"
#    service_bus_namespace_name                                     = "mock-namespace"
#    service_bus_nsip_project_topic_id                              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    service_bus_nsip_documents_topic_id                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    service_bus_nsip_representation_id                             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    servicebus_topic_register_nsip_subscription_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    servicebus_topic_register_representation_id                    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    servicebus_topic_deadline_submission_topic_id                  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    service_bus_nsip_project_update_topic_id                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    service_bus_nsip_exam_timetable_id                             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#    service_bus_nsip_advice_id                                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
#  }
#}

inputs = {
  action_group_low_id                         = dependency.common_ukw.outputs.action_group_low_id
  app_service_plan_id                         = try(dependency.common_uks.outputs.app_service_plan_id, null)
  applications_service_vpn_gateway_shared_key = dependency.common_uks.outputs.applications_service_vpn_gateway_shared_key

  # TODO: ASB-1171 - uncomment when service bus in back office uks set up
  #  back_office_submissions_storage_container_name                 = dependency.back_office_uks.outputs.back_office_submissions_storage_container_name
  #  back_office_submissions_storage_container_resource_manager_id  = dependency.back_office_uks.outputs.back_office_submissions_storage_container_resource_manager_id
  #  back_office_submissions_storage_account_name                   = dependency.back_office_uks.outputs.back_office_document_storage_account_name
  #  back_office_service_bus_namespace_name                         = dependency.back_office_uks.outputs.service_bus_namespace_name
  #  back_office_service_bus_nsip_project_topic_id                  = dependency.back_office_uks.outputs.service_bus_nsip_project_topic_id
  #  back_office_service_bus_nsip_document_topic_id                 = dependency.back_office_uks.outputs.servicebus_topic_nsip_documents_id
  #  back_office_service_bus_register_nsip_subscription_topic_id    = dependency.back_office_uks.outputs.servicebus_topic_register_nsip_subscription_id
  #  back_office_service_bus_register_representation_topic_id       = dependency.back_office_uks.outputs.servicebus_topic_register_representation_id
  #  back_office_service_bus_nsip_project_update_topic_id           = dependency.back_office_uks.outputs.service_bus_nsip_project_update_topic_id
  #  back_office_service_bus_nsip_representation_topic_id           = dependency.back_office_uks.outputs.service_bus_nsip_representation_topic_id
  #  back_office_service_bus_nsip_exam_timetable_topic_id           = dependency.back_office_uks.outputs.service_bus_nsip_exam_timetable_id
  #  back_office_service_bus_nsip_advice_topic_id                   = dependency.back_office_uks.outputs.service_bus_nsip_advice_topic_id
  #  back_office_service_bus_deadline_submission_topic_id           = dependency.back_office_uks.outputs.servicebus_topic_deadline_submission_topic_id
  #  back_office_service_bus_namespace_name                         = "mock-namespace"

  common_resource_group_name           = dependency.common_uks.outputs.common_resource_group_name
  common_vnet_cidr_blocks              = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id               = try(dependency.common_uks.outputs.common_vnet_gateway_id, null)
  common_vnet_id                       = dependency.common_uks.outputs.vnet_id
  common_vnet_name                     = dependency.common_uks.outputs.common_vnet_name
  function_storage_name                = dependency.applications_service_ukw.outputs.function_storage_name
  function_storage_primary_access_key  = dependency.applications_service_ukw.outputs.function_storage_primary_access_key
  integration_subnet_id                = dependency.common_uks.outputs.integration_subnet_id
  key_vault_id                         = dependency.common_ukw.outputs.key_vault_id
  key_vault_uri                        = dependency.common_ukw.outputs.key_vault_uri
  primary_applications_sql_server_id   = dependency.applications_service_ukw.outputs.primary_applications_sql_server_id
  primary_applications_sql_database_id = dependency.applications_service_ukw.outputs.primary_applications_sql_database_id
}
