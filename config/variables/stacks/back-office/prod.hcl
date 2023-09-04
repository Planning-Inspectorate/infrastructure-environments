locals {
  node_environment                                 = "production"
  azuread_auth_client_id                           = "2dc22997-3900-4602-b3bd-46385b60e2b2"
  azuread_appeals_case_officer_group_id            = "5d82e08c-8f05-40ea-a3df-d306f3a2c870"
  azuread_appeals_inspector_group_id               = "c921094a-318f-4996-be5e-9bd2ef9b7bdf"
  azuread_appeals_validation_officer_group_id      = "76d99e25-b02b-4400-96d2-bb9393bbdb9d"
  azuread_applications_case_admin_officer_group_id = "b8bb03d5-9162-4f35-9ff3-856be16dff23"
  azuread_applications_caseteam_group_id           = "ac136ed4-241a-459e-9b4e-267939fd4f08"
  azuread_applications_inspector_group_id          = "9dbf4271-7823-45ed-b1a7-3712f6f2faa3"
  service_bus_failover_enabled                     = true
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 30 # 7-35
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
  applications_front_office_web_url = "https://national-infrastructure-consenting.planninginspectorate.gov.uk"
}
