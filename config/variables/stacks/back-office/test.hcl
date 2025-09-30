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
        users      = ["BC0110001", "BC0110002", "BC0110003", "BC0110015"]
      }
    }
  ]

  sensitive_application_case_references = "BC0110001, BC0110002"

  node_environment                    = "production"
  api_key_vault_authorization_enabled = "true"
  # Azure AD configuration
  azuread_auth_client_id = "dff02ad8-1efc-4f5f-8b1c-58a93edd14f1"
  # Azure AD Applications Groups
  azuread_applications_case_admin_officer_group_id = "b3101fa9-ab47-4eea-9c73-0ea80786131e"
  azuread_applications_caseteam_group_id           = "885e4cc5-7d12-4035-bfd1-9b1c2087d491"
  azuread_applications_inspector_group_id          = "38aa94a5-32c1-4330-8451-e18e32ba26cf"

  # logging
  log_daily_cap_gb                          = 0.4
  back_office_applications_log_level_file   = "silent"
  back_office_applications_log_level_stdout = "info"

  redis_cache_configuration = {
    family   = "C"
    capacity = 0
    sku_name = "Basic"
  }
  service_bus_namespace_config = {
    sku                           = "Premium"
    capacity                      = 1
    public_network_access_enabled = false
    private_endpoint_enabled      = true
    premium_messaging_partitions  = 1
    secondary_enabled             = false
  }
  sql_database_configuration = {
    max_size_gb               = 250 # included
    short_term_retention_days = 7   # 7-35
    audit_retention_days      = 30
    sku_name                  = "S0"
  }
  sql_server_azuread_administrator = {
    login_username = "pins-odt-sql-test-applications-bo"
    object_id      = "74e9d9c6-1455-494b-abde-525b1281573b"
  }
  feature_service_bus_enabled                              = "true"
  notify_subscribers_function_gov_notify_template_id       = "94975c1f-43c1-43a0-81be-61763d423601"
  notify_subscribers_function_gov_notify_template_welsh_id = "40bff0f6-0a4e-43b8-adea-d6ea677dff7e"
  # not ideal to specify this, but using a dependency with terragrunt would create a dependency cycle,
  # as applications is already dependent on back office
  applications_front_office_web_url      = "https://applications-service-test.planninginspectorate.gov.uk"
  odw_synapse_integration_enabled        = true
  back_office_published_documents_domain = "https://back-office-applications-docs-test.planninginspectorate.gov.uk"

  text_analytics_config = {
    deploy = false # use tooling subscription shared instance
  }
}
