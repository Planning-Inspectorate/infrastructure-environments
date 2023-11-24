locals {
  node_environment = "production"
  # Azure AD configuration
  azuread_auth_client_id = "2dc22997-3900-4602-b3bd-46385b60e2b2"
  # Azure AD Appeals Groups
  azuread_appeals_case_officer_group_id = "5d82e08c-8f05-40ea-a3df-d306f3a2c870"
  azuread_appeals_inspector_group_id    = "c921094a-318f-4996-be5e-9bd2ef9b7bdf"
  azuread_appeals_cs_team_group_id      = "785e6615-a9ea-44bf-a669-634e52b6f07a"
  azuread_appeals_legal_team_group_id   = "33fc8bdb-8c82-40ae-9a59-9eb5073f553b"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "b8bb03d5-9162-4f35-9ff3-856be16dff23"
  azuread_applications_caseteam_group_id           = "ac136ed4-241a-459e-9b4e-267939fd4f08"
  azuread_applications_inspector_group_id          = "9dbf4271-7823-45ed-b1a7-3712f6f2faa3"

  # logging
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"
  back_office_appeals_log_level_file        = "silent"
  back_office_appeals_log_level_stdout      = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 1
    sku_name = "Standard"
  }
  service_bus_failover_enabled = true
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
  notify_subscribers_function_gov_notify_template_id = "ee890e9f-5669-40ec-b3f1-f9e6f01024db"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url = "https://national-infrastructure-consenting.planninginspectorate.gov.uk"
  # Migration requirements for integrating with ODW
  # Currently unable to use pipeline environment variables
  odw_subscription_id                = "a82fd28d-5989-4e06-a0bb-1a5d859f9e0c"
  odw_data_lake_storage_account_name = "pinsstodwprodukson83nw"
  odw_resource_group_name            = "pins-rg-data-odw-prod-uks"
  odw_synapse_workspace_name         = "pins-synw-odw-prod-uks"
}
