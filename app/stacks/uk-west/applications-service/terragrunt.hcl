include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    action_group_ids = {
      "appeals-fo-tech"                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "appeals-bo-tech"                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "applications-fo-tech"            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "applications-bo-tech"            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "appeals-fo-service-manager"      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "appeals-bo-service-manager"      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "applications-fo-service-manager" = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "applications-bo-service-manager" = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "iap"                             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "its"                             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "info-sec"                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
    }
    action_group_names = {
      "appeals-bo-service-manager"      = "pins-ag-odt-appeals-bo-service-manager-dev"
      "appeals-bo-tech"                 = "pins-ag-odt-appeals-bo-tech-dev"
      "appeals-fo-service-manager"      = "pins-ag-odt-appeals-fo-service-manager-dev"
      "appeals-fo-tech"                 = "pins-ag-odt-appeals-fo-tech-dev"
      "applications-bo-service-manager" = "pins-ag-odt-applications-bo-service-manager-dev"
      "applications-bo-tech"            = "pins-ag-odt-applications-bo-tech-dev"
      "applications-fo-service-manager" = "pins-ag-odt-applications-fo-service-manager-dev"
      "applications-fo-tech"            = "pins-ag-odt-applications-fo-tech-dev"
      "iap"                             = "pins-ag-odt-iap-dev"
      "info-sec"                        = "pins-ag-odt-info-sec-dev"
      "its"                             = "pins-ag-odt-its-dev"
    }
    app_service_plan_id                         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    applications_service_vpn_gateway_shared_key = "mock_shared_key"
    common_resource_group_name                  = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      app_service_integration        = "10.1.1.0/24"
      applications_service_endpoints = "10.1.3.0/24"
      vpn_gateway                    = "10.1.0.128/25"
    }
    vnet_id                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworks/mock_id"
    common_vnet_gateway_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Network/virtualNetworkGateways/mock_id"
    common_vnet_name       = "mock_vnet_name"
    integration_subnet_id  = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue/subnets/subnetValue"
    key_vault_id           = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri          = "https://mockvault.vault.azure.net/"
  }
}

dependency "back_office_ukw" {
  config_path                             = "../back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    back_office_submissions_storage_container_name                = "mock-name"
    back_office_submissions_storage_container_resource_manager_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Storage/storageAccounts/mock-account/blobServices/default/containers/mock-container"
    back_office_document_storage_account_name                     = "mock-name"
    service_bus_namespace_name                                    = "mock-namespace"
    service_bus_nsip_project_topic_id                             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_documents_topic_id                           = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    servicebus_topic_register_nsip_subscription_id                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    servicebus_topic_register_representation_id                   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    servicebus_topic_deadline_submission_topic_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_project_update_topic_id                      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_representation_id                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_exam_timetable_id                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    service_bus_nsip_s51_advice_topic_id                          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
    servicebus_topic_service_user_id                              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock-namespace/topics/mock-topic"
  }
}

inputs = {
  action_group_ids = {
    tech            = dependency.common.outputs.action_group_ids["applications-fo-tech"]
    service_manager = dependency.common.outputs.action_group_ids["applications-fo-service-manager"]
    iap             = dependency.common.outputs.action_group_ids["iap"]
    its             = dependency.common.outputs.action_group_ids["its"]
    info_sec        = dependency.common.outputs.action_group_ids["info-sec"]
  }
  action_group_names = {
    applications-fo-tech            = dependency.common.outputs.action_group_names["applications-fo-tech"]
    applications-fo-service-manager = dependency.common.outputs.action_group_names["applications-fo-service-manager"]
    iap                             = dependency.common.outputs.action_group_names["iap"]
    its                             = dependency.common.outputs.action_group_names["its"]
    info_sec                        = dependency.common.outputs.action_group_names["info-sec"]
  }
  app_service_plan_id                                           = dependency.common.outputs.app_service_plan_id
  applications_service_vpn_gateway_shared_key                   = dependency.common.outputs.applications_service_vpn_gateway_shared_key
  back_office_service_bus_namespace_name                        = dependency.back_office_ukw.outputs.service_bus_namespace_name
  back_office_service_bus_nsip_project_topic_id                 = dependency.back_office_ukw.outputs.service_bus_nsip_project_topic_id
  back_office_service_bus_nsip_document_topic_id                = dependency.back_office_ukw.outputs.servicebus_topic_nsip_documents_id
  back_office_service_bus_register_nsip_subscription_topic_id   = dependency.back_office_ukw.outputs.servicebus_topic_register_nsip_subscription_id
  back_office_service_bus_register_representation_topic_id      = dependency.back_office_ukw.outputs.servicebus_topic_register_representation_id
  back_office_service_bus_nsip_project_update_topic_id          = dependency.back_office_ukw.outputs.service_bus_nsip_project_update_topic_id
  back_office_service_bus_nsip_representation_topic_id          = dependency.back_office_ukw.outputs.service_bus_nsip_representation_id
  back_office_service_bus_nsip_exam_timetable_topic_id          = dependency.back_office_ukw.outputs.service_bus_nsip_exam_timetable_id
  back_office_service_bus_nsip_service_user_topic_id            = dependency.back_office_ukw.outputs.servicebus_topic_service_user_id
  back_office_service_bus_nsip_advice_topic_id                  = dependency.back_office_ukw.outputs.service_bus_nsip_s51_advice_topic_id
  back_office_service_bus_deadline_submission_topic_id          = dependency.back_office_ukw.outputs.servicebus_topic_deadline_submission_topic_id
  back_office_submissions_storage_container_name                = dependency.back_office_ukw.outputs.back_office_submissions_storage_container_name
  back_office_submissions_storage_container_resource_manager_id = dependency.back_office_ukw.outputs.back_office_submissions_storage_container_resource_manager_id
  back_office_submissions_storage_account_name                  = dependency.back_office_ukw.outputs.back_office_document_storage_account_name
  common_resource_group_name                                    = dependency.common.outputs.common_resource_group_name
  common_vnet_cidr_blocks                                       = dependency.common.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id                                        = dependency.common.outputs.common_vnet_gateway_id
  common_vnet_name                                              = dependency.common.outputs.common_vnet_name
  integration_subnet_id                                         = dependency.common.outputs.integration_subnet_id
  key_vault_id                                                  = dependency.common.outputs.key_vault_id
  key_vault_uri                                                 = dependency.common.outputs.key_vault_uri
}
