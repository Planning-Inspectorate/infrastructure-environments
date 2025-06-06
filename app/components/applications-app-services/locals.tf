locals {
  app_services = {
    applications_frontend = {
      # use a shorter name in training env to avoid 60 char app name limit
      app_name   = var.environment == "training" ? "wfe" : "applications-wfe"
      image_name = "applications-service/forms-web-app"

      # Networking
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      auth_enabled                    = var.applications_easy_auth_config.web_auth_enabled
      endpoint_subnet_id              = var.endpoint_subnet_id
      front_door_restriction          = true
      inbound_vnet_connectivity       = true
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true
      public_network_access           = true
      client_affinity_enabled         = var.client_affinity_enabled
      worker_count                    = var.app_worker_count

      app_settings = {
        ACTIVATE_PLANNED_OUTAGE                      = var.activate_planned_outage
        APPLICATIONINSIGHTS_CONNECTION_STRING        = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/applications-service-app-insights-connection-string/)"
        BACK_OFFICE_INTEGRATION_GET_APPLICATIONS     = var.back_office_integration_get_applications
        APPLICATIONS_SERVICE_API_TIMEOUT             = var.api_timeout
        APPLICATIONS_SERVICE_API_URL                 = "https://pins-app-${var.service_name}-${var.environment == "training" ? "api" : "applications-api"}-${var.resource_suffix}.azurewebsites.net/"
        FEATURE_ALLOW_WELSH_TRANSLATION              = var.feature_allow_welsh_translation
        FEATURE_APPLICATION_INSIGHTS                 = var.feature_application_insights
        FEATURE_ENABLE_GENERALISED_FORM_SANITISATION = var.feature_enable_generalised_form_sanitisation
        FEATURE_ENABLED_CONTENT_SECURITY_POLICY      = var.feature_enabled_content_security_policy
        FEATURE_HOME_PAGE                            = var.feature_home_page
        FEATURE_PRIMARY_NAVIGATION                   = var.feature_primary_navigation
        FEATURE_PROJECT_INFORMATION                  = var.feature_allow_project_information
        FEATURE_PROJECT_TIMELINE_LINK                = var.feature_hide_project_timeline_link
        FEATURE_GENERAL_S51_BO                       = var.feature_general_s51_bo
        FEATURE_REGISTER_OF_ADVICE                   = var.feature_register_of_advice
        FEATURE_ALLOW_WELSH_CASES                    = var.feature_allow_welsh_cases
        FEATURE_REDIS_SESSION_STORE                  = var.feature_redis_session_store
        FEATURE_SAVE_AND_EXIT_OPTION                 = var.feature_save_and_exit_option
        FEATURE_SHOW_AFFECTED_AREA_SECTION           = var.feature_show_affected_area_section
        FILE_UPLOADS_PATH                            = "/opt/app/uploads"
        GOOGLE_ANALYTICS_ID                          = var.google_analytics_id
        HOST_URL                                     = "https://${var.applications_service_public_url}/"
        MICROSOFT_PROVIDER_AUTHENTICATION_SECRET     = local.secret_refs["applications-service-microsoft-provider-authentication-secret"]
        OPEN_REGISTRATION_CASE_REFERENCES            = var.open_registration_case_references
        OS_MAPS_API_KEY                              = local.secret_refs["applications-service-os-maps-api-key"]
        OS_MAPS_API_SECRET                           = local.secret_refs["applications-service-os-maps-api-secret"]
        PLANNED_OUTAGE_RESUME_TEXT                   = var.planned_outage_resume_text
        REDIS_CONNECTION_STRING                      = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${var.applications_service_redis_connection_string_secret_name}/)"
        SESSION_KEY                                  = local.secret_refs["applications-service-session-key"]
        SUBDOMAIN_OFFSET                             = "3"
        USE_SECURE_SESSION_COOKIES                   = true,
        RETRY_MAX_ATTEMPTS                           = "3"
        RETRY_STATUS_CODES                           = "500,502,503,504"
        WEBSITE_AUTH_AAD_ALLOWED_TENANTS             = data.azurerm_client_config.current.tenant_id
      }
    }

    applications_service_api = {
      # use a shorter name in training env to avoid 60 char app name limit
      app_name   = var.environment == "training" ? "api" : "applications-api"
      image_name = "applications-service/applications-service-api"

      # Networking
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      auth_enabled                    = false
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      front_door_restriction          = false
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true
      public_network_access           = !var.private_endpoint_enabled
      worker_count                    = var.app_worker_count

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING                     = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/applications-service-app-insights-connection-string/)"
        APPLICATIONS_WEB_BASE_URL                                 = "https://${var.applications_service_public_url}"
        BACK_OFFICE_BLOB_STORAGE_DEADLINE_SUBMISSION_URL          = "https://${var.back_office_submissions_storage_account_name}.blob.core.windows.net"
        BACK_OFFICE_BLOB_STORAGE_DEADLINE_SUBMISSION_CONTAINER    = var.back_office_submissions_storage_container_name
        BACK_OFFICE_API_INTEGRATION_CASE_REFERENCES               = var.back_office_integration_case_references
        BACK_OFFICE_INTEGRATION_GET_APPLICATIONS                  = var.back_office_integration_get_applications
        FEATURE_ALLOW_WELSH_CASES                                 = var.feature_allow_welsh_cases
        FEATURE_REGISTER_OF_ADVICE                                = var.feature_register_of_advice
        BACK_OFFICE_SERVICE_BUS_ENABLED                           = "true"
        BACK_OFFICE_SERVICE_BUS_HOSTNAME                          = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
        DATABASE_URL                                              = "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/applications-service-sql-server-connection-string-app/)"
        DOCUMENTS_HOST                                            = var.documents_host
        ENCRYPTION_SECRET_KEY                                     = local.secret_refs["applications-service-encryption-secret-key"]
        FEATURE_APPLICATION_INSIGHTS                              = var.feature_application_insights
        FILE_UPLOADS_PATH                                         = "/opt/app/uploads"
        LOGGER_LEVEL                                              = var.logger_level
        MYSQL_DATABASE                                            = local.secret_refs["applications-service-mysql-database"]
        MYSQL_DIALECT                                             = local.secret_refs["applications-service-mysql-dialect"]
        MYSQL_HOST                                                = local.secret_refs["applications-service-mysql-host"]
        MYSQL_PASSWORD                                            = local.secret_refs["applications-service-mysql-password"]
        MYSQL_PORT                                                = local.secret_refs["applications-service-mysql-port"]
        MYSQL_USERNAME                                            = local.secret_refs["applications-service-mysql-username"]
        NI_API_HOST                                               = local.secret_refs["applications-service-ni-api-host"]
        NI_OAUTH_CLIENT_ID                                        = local.secret_refs["applications-service-ni-oauth-client-id"]
        NI_OAUTH_CLIENT_SECRET                                    = local.secret_refs["applications-service-ni-oauth-client-secret"]
        NI_OAUTH_PASSWORD                                         = local.secret_refs["applications-service-ni-oauth-password"]
        NI_OAUTH_USERNAME                                         = local.secret_refs["applications-service-ni-oauth-username"]
        NODE_ENV                                                  = var.node_environment
        SERVER_PORT                                               = "3000"
        SERVER_SHOW_ERRORS                                        = true
        SERVER_TERMINATION_GRACE_PERIOD_SECONDS                   = "0"
        SRV_NOTIFY_API_KEY                                        = local.secret_refs["applications-srv-notify-api-key"]
        SRV_NOTIFY_BASE_URL                                       = var.srv_notify_base_url
        SRV_NOTIFY_IP_REGISTRATION_CONFIRMATION_EMAIL_TO_IP       = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id
        SRV_NOTIFY_IP_REGISTRATION_CONFIRMATION_EMAIL_TO_IP_WELSH = var.srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh
        SRV_NOTIFY_SERVICE_ID                                     = var.srv_notify_service_id
        SRV_NOTIFY_SUBMISSION_COMPLETE_EMAIL                      = var.srv_notify_submission_complete_email_template_id
        SRV_NOTIFY_SUBMISSION_COMPLETE_EMAIL_WELSH                = var.srv_notify_submission_complete_email_template_id_welsh
        SRV_NOTIFY_SUBSCRIPTION_CREATE_EMAIL                      = var.srv_notify_subscription_create_email_template_id
        SRV_NOTIFY_SUBSCRIPTION_CREATE_EMAIL_WELSH                = var.srv_notify_subscription_create_email_template_id_welsh
      }
    }
  }

  secret_names = [
    "applications-service-microsoft-provider-authentication-secret",
    "applications-service-encryption-secret-key",
    "applications-service-mysql-database",
    "applications-service-mysql-dialect",
    "applications-service-mysql-host",
    "applications-service-mysql-password",
    "applications-service-mysql-port",
    "applications-service-mysql-username",
    "applications-service-ni-api-host",
    "applications-service-ni-oauth-client-id",
    "applications-service-ni-oauth-client-secret",
    "applications-service-ni-oauth-username",
    "applications-service-ni-oauth-password",
    "applications-srv-notify-api-key",
    "applications-service-session-key",
    "applications-service-os-maps-api-key",
    "applications-service-os-maps-api-secret"
  ]

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }
}
