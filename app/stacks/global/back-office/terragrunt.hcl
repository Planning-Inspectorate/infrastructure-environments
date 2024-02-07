include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "back_office_uks" {
  config_path                             = "../../uk-south/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_frontend_uks         = "mock-wfe-url"
      back_office_appeals_frontend_uks = "mock-wfe-url"
    }
    appeals_web_frontend_url = "mock-appeals-wfe-url"
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
    appeals_web_frontend_url = "mock-appeals-wfe-url"
  }
}

dependency "common_ukw" {
  config_path                             = "../../uk-west/common"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    key_vault_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.KeyVault/vaults/mockkv"
  }
}

dependency "front_door" {
  config_path                             = "../front-door"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    frontend_endpoint_mappings = {
      back_office_appeals_frontend = {
        frontend_name        = "BackOfficeAppeals"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
    }
    frontend_endpoints = {
      BackOfficeAppeals = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
    }
  }
}

inputs = {
  back_office_appeals_primary_app_service_url   = dependency.back_office_ukw.outputs.appeals_web_frontend_url
  back_office_appeals_secondary_app_service_url = dependency.back_office_uks.outputs.appeals_web_frontend_url
  common_key_vault_id                           = dependency.common_ukw.outputs.key_vault_id
  common_log_analytics_workspace_id             = dependency.common_ukw.outputs.log_analytics_workspace_id
  frontend_endpoint_mappings                    = dependency.front_door.outputs.frontend_endpoint_mappings
  frontend_endpoints                            = dependency.front_door.outputs.frontend_endpoints
}
