locals {
  node_environment                    = "production"
  horizon_url                         = "http://10.0.7.4:8000"
  mock_horizon                        = false
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "dff02ad8-1efc-4f5f-8b1c-58a93edd14f1"
  # Azure AD Appeals Groups
  azuread_appeals_case_officer_group_id = "e30a4389-029b-4de8-a94b-c492a3a0854a"
  azuread_appeals_inspector_group_id    = "3cf2c6ae-cd39-4027-accd-3c906b5462d4"
  azuread_appeals_cs_team_group_id      = "812fec35-4f1e-4a7c-bb1a-49d1a9fea519"
  azuread_appeals_legal_team_group_id   = "5ab0da43-964d-4897-ae44-880fe7990225"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "b3101fa9-ab47-4eea-9c73-0ea80786131e"
  azuread_applications_caseteam_group_id           = "885e4cc5-7d12-4035-bfd1-9b1c2087d491"
  azuread_applications_inspector_group_id          = "38aa94a5-32c1-4330-8451-e18e32ba26cf"

  # logging
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"
  back_office_appeals_log_level_file        = "silent"
  back_office_appeals_log_level_stdout      = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 0
    sku_name = "Basic"
  }
  service_bus_failover_enabled = true
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 7 # 7-35
    audit_retention_days      = 30
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "sulmarch"
    object_id      = "42523fcb-4a32-4910-8caa-4d310c7bfd55" # sulmarch@pinso365.onmicrosoft.com
  }
  feature_appeal_broadcasts_enabled                  = "true"
  feature_service_bus_enabled                        = "true"
  feature_document_scanning_enabled                  = true
  notify_subscribers_function_gov_notify_template_id = "94975c1f-43c1-43a0-81be-61763d423601"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://applications-service-test.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = true
  back_office_published_documents_domain = "https://back-office-applications-docs-test.planninginspectorate.gov.uk"
}
