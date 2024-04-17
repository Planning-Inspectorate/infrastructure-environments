include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "back_office_uks" {
  config_path                             = "../../uk-south/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_appeals_frontend_uks = "mock-wfe-url"
    }
    # appeals_web_frontend_url = "mock-appeals-wfe-url"
  }
}

dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true

  mock_outputs = {
    app_service_urls = {
      back_office_appeals_frontend_ukw = "mock-wfe-url"
    }
    # appeals_web_frontend_url = "mock-appeals-wfe-url"
  }
}

inputs = {
  back_office_appeals_primary_app_service_url = dependency.back_office_ukw.outputs.appeals_web_frontend_url
  published_documents_blob_storage_endpoint   = dependency.back_office_ukw.outputs.back_office_document_storage_api_host
}
