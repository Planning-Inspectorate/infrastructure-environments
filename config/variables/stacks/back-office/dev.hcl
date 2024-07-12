locals {
  back_office_feature_flags = [
    {
      name    = "boas-1-test-feature"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "applic-55-welsh-translation"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "applic-625-custom-folders"
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    }
  ]
  node_environment                    = "production"
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "7cab8971-c305-4b9a-82db-21b5fd84efbd"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "5420e6d8-b155-4839-ab97-cc9893cdb628"
  azuread_applications_caseteam_group_id           = "3cd1a46e-7b0d-48f4-a342-b5eb15344c42"
  azuread_applications_inspector_group_id          = "b197404b-f185-4d26-9ff8-a4e42d5b3d70"

  # logging
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"

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
    login_username = "pins-odt-sql-dev-applications-bo"
    object_id      = "e51a2615-6b74-4eb6-9c56-e7a6f2bca721"
  }
  feature_service_bus_enabled                              = "true"
  notify_subscribers_function_gov_notify_template_id       = "94975c1f-43c1-43a0-81be-61763d423601"
  notify_subscribers_function_gov_notify_template_welsh_id = "40bff0f6-0a4e-43b8-adea-d6ea677dff7e"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://applications-service-dev.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = true
  back_office_published_documents_domain = "https://back-office-applications-docs-dev.planninginspectorate.gov.uk"
}
