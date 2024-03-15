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
      "info-sec"                        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "data-tech"                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock",
      "data-service-manager"            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/microsoft.insights/actionGroups/mock"
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
    app_service_plan_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/pins-rg-common-dev-ukw-001/providers/Microsoft.Web/serverfarms/mock_id"
    back_office_integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock_resource_group/mock/mock_id"
    back_office_clamav_subnet_id      = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock_resource_group/mock/mock_id"
    common_resource_group_name        = "mock_resource_group_name"
    common_vnet_cidr_blocks = {
      back_office_endpoints = "10.1.4.0/24"
    }
    vnet_id               = "mock_vnet_id"
    common_vnet_name      = "mock_vnet_name"
    integration_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/mock/mock_id"
    key_vault_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock_resource_group/providers/Microsoft.KeyVault/vaults/mockvault"
    key_vault_uri         = "https://mockvault.vault.azure.net/"
  }
}

inputs = {
  action_group_ids_map = dependency.common.outputs.action_group_ids
  action_group_ids = {
    bo_appeals_tech                 = dependency.common.outputs.action_group_ids["appeals-bo-tech"]
    bo_appeals_service_manager      = dependency.common.outputs.action_group_ids["appeals-bo-service-manager"]
    bo_applications_tech            = dependency.common.outputs.action_group_ids["applications-bo-tech"]
    bo_applications_service_manager = dependency.common.outputs.action_group_ids["applications-bo-service-manager"]
    iap                             = dependency.common.outputs.action_group_ids["iap"]
    its                             = dependency.common.outputs.action_group_ids["its"]
    info_sec                        = dependency.common.outputs.action_group_ids["info-sec"]
  }
  action_group_names = {
    bo_appeals_tech                 = dependency.common.outputs.action_group_names["appeals-bo-tech"]
    bo_appeals_service_manager      = dependency.common.outputs.action_group_names["appeals-bo-service-manager"]
    bo_applications_tech            = dependency.common.outputs.action_group_names["applications-bo-tech"]
    bo_applications_service_manager = dependency.common.outputs.action_group_names["applications-bo-service-manager"]
    iap                             = dependency.common.outputs.action_group_names["iap"]
    its                             = dependency.common.outputs.action_group_names["its"]
    info_sec                        = dependency.common.outputs.action_group_names["info-sec"]
  }

  app_service_plan_id               = dependency.common.outputs.app_service_plan_id
  back_office_integration_subnet_id = dependency.common.outputs.back_office_integration_subnet_id
  back_office_clamav_subnet_id      = dependency.common.outputs.back_office_clamav_subnet_id
  common_resource_group_name        = dependency.common.outputs.common_resource_group_name
  common_vnet_cidr_blocks           = dependency.common.outputs.common_vnet_cidr_blocks
  common_vnet_gateway_id            = dependency.common.outputs.common_vnet_gateway_id
  common_vnet_id                    = dependency.common.outputs.vnet_id
  common_vnet_name                  = dependency.common.outputs.common_vnet_name
  integration_subnet_id             = dependency.common.outputs.integration_subnet_id
  key_vault_uri                     = dependency.common.outputs.key_vault_uri
  key_vault_id                      = dependency.common.outputs.key_vault_id
}
