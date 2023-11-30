include {
  path = "../../../../config/terragrunt.hcl"
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
      applications_frontend = {
        frontend_name        = "ApplicationsService"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
      appeals_frontend = {
        frontend_name        = "appeal-planning-decision-service-gov-uk"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
      back_office_frontend = {
        frontend_name        = "BackOffice"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
      back_office_appeals_frontend = {
        frontend_name        = "BackOfficeAppeals"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
      comment_planning_appeal_frontend = {
        frontend_name        = "CommentPlanningAppeal"
        frontend_endpoint    = "mock_url"
        patterns_to_match    = ["/*"]
        ssl_certificate_name = "mock_certificate_name"
      }
    }
    frontend_endpoints = {
      ApplicationsService                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
      appeal-planning-decision-service-gov-uk = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
      BackOffice                              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
      BackOfficeAppeals                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
      CommentPlanningAppeal                   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mock-rg/providers/Microsoft.Network/frontDoors/mock_front_door/frontendEndpoints/mock_id"
    }
  }
}

inputs = {
  common_key_vault_id        = dependency.common_ukw.outputs.key_vault_id
  frontend_endpoint_mappings = dependency.front_door.outputs.frontend_endpoint_mappings
  frontend_endpoints         = dependency.front_door.outputs.frontend_endpoints
}
