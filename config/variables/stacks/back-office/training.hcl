locals {
  back_office_feature_flags = [
    {
      name    = "boas-1-test-feature"
      enabled = false
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "applic-55-welsh-translation"
      enabled = false
      targeting = {
        percentage = 100
        users      = []
      }
    }
  ]
  node_environment                    = "production"
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "56df733e-a198-474b-99bc-949b1cd91660"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "e2efbf94-a2f3-4094-95f7-5b6348d0d4c3"
  azuread_applications_caseteam_group_id           = "b7611313-503e-4003-b35f-ef6044086c59"
  azuread_applications_inspector_group_id          = "000ad7e9-31ad-4c6c-b9c8-d78e42495548"

  # logging
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 1
    sku_name = "Standard"
  }
  service_bus_failover_enabled = false
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 30 # 7-35
    audit_retention_days      = 120
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-training-applications-bo"
    object_id      = "228592ab-d0f3-445b-b714-38148624c21f"
  }
  feature_service_bus_enabled                        = "true"
  feature_document_scanning_enabled                  = true
  notify_subscribers_function_gov_notify_template_id = "ee890e9f-5669-40ec-b3f1-f9e6f01024db"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://applications-service-training.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = false
  back_office_published_documents_domain = "https://back-office-applications-docs-train.planninginspectorate.gov.uk"
}
