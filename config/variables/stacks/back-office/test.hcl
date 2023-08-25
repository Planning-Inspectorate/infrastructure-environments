locals {
  node_environment = "production"
  # Azure AD configuration
  azuread_auth_client_id = "dff02ad8-1efc-4f5f-8b1c-58a93edd14f1"
  # Azure AD Appeals Groups
  azuread_appeals_case_officer_group_id       = "5d82e08c-8f05-40ea-a3df-d306f3a2c870"
  azuread_appeals_inspector_group_id          = "c921094a-318f-4996-be5e-9bd2ef9b7bdf"
  azuread_appeals_validation_officer_group_id = "76d99e25-b02b-4400-96d2-bb9393bbdb9d"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "b3101fa9-ab47-4eea-9c73-0ea80786131e"
  azuread_applications_caseteam_group_id           = "885e4cc5-7d12-4035-bfd1-9b1c2087d491"
  azuread_applications_inspector_group_id          = "38aa94a5-32c1-4330-8451-e18e32ba26cf"

  service_bus_failover_enabled = true
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 7 # 7-35
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "sulmarch"
    object_id      = "42523fcb-4a32-4910-8caa-4d310c7bfd55" # sulmarch@pinso365.onmicrosoft.com
  }
  feature_service_bus_enabled                        = "true"
  feature_document_scanning_enabled                  = true
  notify_subscribers_function_gov_notify_template_id = "94975c1f-43c1-43a0-81be-61763d423601"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url = "https://applications-service-test.planninginspectorate.gov.uk"
}
