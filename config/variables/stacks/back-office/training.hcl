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
    },
    {
      name    = "applics-861-fo-submissions",
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "applics-1036-training-sector",
      enabled = false
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "applics-1845-fees-forecasting",
      enabled = true
      targeting = {
        percentage = 100
        users      = []
      }
    },
    {
      name    = "azure-ai-language-redaction",
      enabled = true
      targeting = {
        percentage = 100
        users      = [] //no values enables flag globally
      }
    }
  ]

  sensitive_application_case_references = "BC0110001, BC0110002"


  node_environment                    = "production"
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "56df733e-a198-474b-99bc-949b1cd91660"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "e2efbf94-a2f3-4094-95f7-5b6348d0d4c3"
  azuread_applications_caseteam_group_id           = "b7611313-503e-4003-b35f-ef6044086c59"
  azuread_applications_inspector_group_id          = "000ad7e9-31ad-4c6c-b9c8-d78e42495548"

  # logging
  log_daily_cap_gb                          = 0.4
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 1
    sku_name = "Standard"
  }
  service_bus_namespace_config = {
    sku                           = "Standard"
    capacity                      = 0
    public_network_access_enabled = true
    private_endpoint_enabled      = false
    premium_messaging_partitions  = 0
    secondary_enabled             = false
  }
  sql_database_configuration = {
    max_size_gb               = 250 # included
    short_term_retention_days = 30  # 7-35
    audit_retention_days      = 120
    sku_name                  = "S0"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-training-applications-bo"
    object_id      = "228592ab-d0f3-445b-b714-38148624c21f"
  }
  feature_service_bus_enabled                              = "true"
  notify_subscribers_function_gov_notify_template_id       = "ee890e9f-5669-40ec-b3f1-f9e6f01024db"
  notify_subscribers_function_gov_notify_template_welsh_id = "d0278b88-a0cb-496b-be22-f8bbbe3e45a8"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://applications-service-training.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = false
  back_office_published_documents_domain = "https://back-office-applications-docs-train.planninginspectorate.gov.uk"

  text_analytics_config = {
    deploy = false # use tooling subscription shared instance
  }
}
