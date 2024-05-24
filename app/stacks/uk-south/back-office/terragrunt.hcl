include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "common_uks" {
  config_path                             = "../common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_plan_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    back_office_integration_subnet_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue/subnets/subnetValue"
    back_office_clamav_subnet_id      = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue/subnets/subnetValue"
    common_resource_group_name        = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    vnet_id               = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue"
    common_vnet_name      = "mock_vnet_name"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
  }
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
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
    common_resource_group_name = "mock_resource_group_name"
    key_vault_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri              = "https://mockvault.vault.azure.net/"
  }
}

dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    back_office_document_storage_api_host                                               = "https://mockstorageaccount.blob.core.windows.net/"
    back_office_sql_database                                                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server/databases/mock_sql_db"
    back_office_document_storage_container_name                                         = "mock-name"
    document_check_function_storage_name                                                = "mockstorageaccount"
    document_check_function_storage_primary_access_key                                  = "mockaccesskey"
    document_storage_back_office_document_service_uploads_container_id                  = "123"
    document_storage_back_office_document_service_uploads_container_resource_manager_id = "123"
    document_storage_back_office_published_documents_container_resource_manager_id      = "123"
    document_storage_submissions_container_resource_manager_id                          = "123"
    document_storage_back_office_document_service_uploads_container_name                = "test-container"
    document_storage_back_office_published_documents_container_id                       = "123"
    service_bus_namespace_id                                                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.ServiceBus/namespaces/mock_sb_namespace"
    servicebus_topic_nsip_documents_id                                                  = "123"
    servicebus_topic_service_user_id                                                    = "123"
    deadline_submissions_result_topic_name                                              = "mock-name"
    sql_server_id                                                                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.Sql/servers/mock_sql_server"
    sql_server_password                                                                 = "mockpass"
    sql_server_username                                                                 = "mockuser"
  }
}

inputs = {
  action_group_ids = {
    bo_applications_tech            = dependency.common_ukw.outputs.action_group_ids["applications-bo-tech"]
    bo_applications_service_manager = dependency.common_ukw.outputs.action_group_ids["applications-bo-service-manager"]
    iap                             = dependency.common_ukw.outputs.action_group_ids["iap"]
    its                             = dependency.common_ukw.outputs.action_group_ids["its"]
    info_sec                        = dependency.common_ukw.outputs.action_group_ids["info-sec"]
  }
  action_group_names = {
    bo_applications_tech            = dependency.common_ukw.outputs.action_group_names["applications-bo-tech"]
    bo_applications_service_manager = dependency.common_ukw.outputs.action_group_names["applications-bo-service-manager"]
    iap                             = dependency.common_ukw.outputs.action_group_names["iap"]
    its                             = dependency.common_ukw.outputs.action_group_names["its"]
    info_sec                        = dependency.common_ukw.outputs.action_group_names["info-sec"]
  }
  app_service_plan_id                                                                 = try(dependency.common_uks.outputs.app_service_plan_id, null)
  back_office_document_storage_api_host                                               = dependency.back_office_ukw.outputs.back_office_document_storage_api_host
  back_office_document_storage_container_name                                         = dependency.back_office_ukw.outputs.back_office_document_storage_container_name
  back_office_integration_subnet_id                                                   = dependency.common_uks.outputs.back_office_integration_subnet_id
  back_office_clamav_subnet_id                                                        = dependency.common_uks.outputs.back_office_clamav_subnet_id
  back_office_sql_database                                                            = dependency.back_office_ukw.outputs.back_office_sql_database
  common_resource_group_name                                                          = dependency.common_uks.outputs.common_resource_group_name
  common_resource_group_name_ukw                                                      = dependency.common_ukw.outputs.common_resource_group_name
  common_vnet_cidr_blocks                                                             = dependency.common_uks.outputs.common_vnet_cidr_blocks
  common_vnet_id                                                                      = dependency.common_uks.outputs.vnet_id
  common_vnet_name                                                                    = dependency.common_uks.outputs.common_vnet_name
  document_check_function_storage_name                                                = dependency.back_office_ukw.outputs.document_check_function_storage_name
  document_check_function_storage_primary_access_key                                  = dependency.back_office_ukw.outputs.document_check_function_storage_primary_access_key
  document_storage_back_office_document_service_uploads_container_id                  = dependency.back_office_ukw.outputs.document_storage_back_office_document_service_uploads_container_id
  document_storage_back_office_document_service_uploads_container_resource_manager_id = dependency.back_office_ukw.outputs.document_storage_back_office_document_service_uploads_container_resource_manager_id
  document_storage_back_office_published_documents_container_resource_manager_id      = dependency.back_office_ukw.outputs.document_storage_back_office_published_documents_container_resource_manager_id
  document_storage_back_office_document_service_uploads_container_name                = dependency.back_office_ukw.outputs.document_storage_back_office_document_service_uploads_container_name
  document_storage_back_office_published_documents_container_resource_manager_id      = dependency.back_office_ukw.outputs.document_storage_back_office_published_documents_container_resource_manager_id
  document_storage_submissions_container_resource_manager_id                          = dependency.back_office_ukw.outputs.back_office_submissions_storage_container_resource_manager_id
  function_apps_storage_account                                                       = dependency.back_office_ukw.outputs.function_apps_storage_account
  function_apps_storage_account_access_key                                            = dependency.back_office_ukw.outputs.function_apps_storage_account_access_key
  integration_subnet_id                                                               = dependency.common_uks.outputs.integration_subnet_id
  key_vault_id                                                                        = dependency.common_ukw.outputs.key_vault_id
  key_vault_uri                                                                       = dependency.common_ukw.outputs.key_vault_uri
  primary_service_bus_namespace_id                                                    = dependency.back_office_ukw.outputs.service_bus_namespace_id
  primary_sql_server_id                                                               = dependency.back_office_ukw.outputs.sql_server_id
  servicebus_topic_nsip_documents_id                                                  = dependency.back_office_ukw.outputs.servicebus_topic_nsip_documents_id
  sql_server_password                                                                 = dependency.back_office_ukw.outputs.sql_server_password
  sql_server_username                                                                 = dependency.back_office_ukw.outputs.sql_server_username
}
