include {
  path = "../../../../config/terragrunt.hcl"
}

dependency "back_office_ukw" {
  config_path                             = "../../uk-west/back-office"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs_merge_with_state           = true
}

inputs = {
  published_documents_blob_storage_endpoint = dependency.back_office_ukw.outputs.back_office_document_storage_api_host
}
