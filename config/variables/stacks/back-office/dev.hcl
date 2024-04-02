locals {
  node_environment                    = "production"
  horizon_web_url                     = "" # Mocking Horizon on dev
  horizon_api_url                     = "http://10.0.7.4:8000"
  horizon_mock_integration            = true
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "7cab8971-c305-4b9a-82db-21b5fd84efbd"
  # Azure AD Appeals Groups
  azuread_appeals_case_officer_group_id = "cc4133e5-2319-4762-8a7b-33413701210a"
  azuread_appeals_inspector_group_id    = "0724c372-098d-4eef-acfb-bc85cd483dd1"
  azuread_appeals_cs_team_group_id      = "455cbf03-f92f-4357-8daa-9f513b21fb73"
  azuread_appeals_legal_team_group_id   = "369caed5-fe22-445e-8cdc-8b2f6746afc7"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "5420e6d8-b155-4839-ab97-cc9893cdb628"
  azuread_applications_caseteam_group_id           = "3cd1a46e-7b0d-48f4-a342-b5eb15344c42"
  azuread_applications_inspector_group_id          = "b197404b-f185-4d26-9ff8-a4e42d5b3d70"

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
  service_bus_failover_enabled = false
  sql_database_configuration = {
    max_size_gb               = 2
    short_term_retention_days = 7 # 7-35
    audit_retention_days      = 7
    sku_name                  = "Basic"
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
  applications_front_office_web_url      = "https://applications-service-dev.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = true
  back_office_appeals_public_url         = "back-office-appeals-dev.planninginspectorate.gov.uk"
  back_office_published_documents_domain = "https://back-office-applications-docs-dev.planninginspectorate.gov.uk"
}
