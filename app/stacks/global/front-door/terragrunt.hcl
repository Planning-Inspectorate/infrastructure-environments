include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "appeals_service_uks" {
  config_path                             = "../../uk-south/appeals-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      appeals_frontend_uks = "mock-wfe-url"
    }
  }
}


dependency "appeals_service_ukw" {
  config_path                             = "../../uk-west/appeals-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      appeals_frontend_ukw = "mock-wfe-url"
    }
  }
}

dependency "applications_service_uks" {
  config_path                             = "../../uk-south/applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      applications_frontend_uks = "mock-wfe-url"
    }
  }
}

dependency "applications_service_ukw" {
  config_path                             = "../../uk-west/applications-service"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      applications_frontend_ukw = "mock-wfe-url"
    }
  }
}

dependency "back_office_uks" {
  config_path                             = "../../uk-south/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_frontend_uks = "mock-wfe-url"
    }
  }
}

dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_frontend_ukw = "mock-wfe-url"
    }
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

inputs = {
  app_service_urls = merge(
    dependency.appeals_service_uks.outputs.app_service_urls,
    dependency.appeals_service_ukw.outputs.app_service_urls,
    dependency.applications_service_uks.outputs.app_service_urls,
    dependency.applications_service_ukw.outputs.app_service_urls,
    dependency.back_office_uks.outputs.app_service_urls,
    dependency.back_office_ukw.outputs.app_service_urls
  )
  common_key_vault_id = dependency.common_ukw.outputs.key_vault_id
}
