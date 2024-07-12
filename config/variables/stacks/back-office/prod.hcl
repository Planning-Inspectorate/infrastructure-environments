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
    },
    {
      name    = "applic-625-custom-folders"
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
  azuread_auth_client_id = "2dc22997-3900-4602-b3bd-46385b60e2b2"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "b8bb03d5-9162-4f35-9ff3-856be16dff23"
  azuread_applications_caseteam_group_id           = "ac136ed4-241a-459e-9b4e-267939fd4f08"
  azuread_applications_inspector_group_id          = "9dbf4271-7823-45ed-b1a7-3712f6f2faa3"

  # logging
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 1
    sku_name = "Standard"
  }
  service_bus_failover_enabled = true
  sql_database_configuration = {
    max_size_gb               = 1024
    short_term_retention_days = 30 # 7-35
    audit_retention_days      = 120
    sku_name                  = "S3"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-prod-applications-bo"
    object_id      = "60e03257-1306-4a53-b7fb-2e7bd5936fdf"
  }
  feature_service_bus_enabled                              = "true"
  notify_subscribers_function_gov_notify_template_id       = "ee890e9f-5669-40ec-b3f1-f9e6f01024db"
  notify_subscribers_function_gov_notify_template_welsh_id = "d0278b88-a0cb-496b-be22-f8bbbe3e45a8"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://national-infrastructure-consenting.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = true
  back_office_published_documents_domain = "https://nsip-documents.planninginspectorate.gov.uk"
}
