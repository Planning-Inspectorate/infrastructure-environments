locals {
  app_services = {
    #====================================
    # Frontends
    #====================================

    appeals_frontend = {
      app_name                   = "appeals-wfe"
      front_door_restriction     = true
      image_name                 = "appeal-planning-decision/forms-web-app"
      inbound_vnet_connectivity  = false
      integration_subnet_id      = var.integration_subnet_id
      key_vault_access           = true
      outbound_vnet_connectivity = true

      app_settings = {
        ALLOW_TESTING_OVERRIDES                    = var.allow_testing_overrides
        APPLICATIONINSIGHTS_CONNECTION_STRING      = local.secret_refs["appeals-app-insights-connection-string"]
        APPEALS_SERVICE_API_TIMEOUT                = var.api_timeout
        APPEALS_SERVICE_API_URL                    = "https://pins-app-${var.service_name}-appeals-api-${var.resource_suffix}.azurewebsites.net"
        CLAM_AV_HOST                               = "https://pins-app-${var.service_name}-clamav-api-${var.resource_suffix}.azurewebsites.net"
        DOCS_API_PATH                              = "/opt/app/api"
        DOCUMENTS_SERVICE_API_TIMEOUT              = var.api_timeout
        DOCUMENTS_SERVICE_API_URL                  = "https://pins-app-${var.service_name}-documents-api-${var.resource_suffix}.azurewebsites.net/"
        FEATURE_FLAG_GOOGLE_TAG_MANAGER            = false
        FEATURE_FLAG_NEW_APPEAL_JOURNEY            = true
        FILE_UPLOAD_DEBUG                          = true
        FILE_UPLOAD_MAX_FILE_SIZE_BYTES            = "15000000"
        FILE_UPLOAD_TMP_PATH                       = "/tmp"
        FILE_UPLOAD_USE_TEMP_FILES                 = true
        GOOGLE_ANALYTICS_ID                        = var.google_analytics_id
        GOOGLE_TAG_MANAGER_ID                      = var.google_tag_manager_id
        HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION = true
        HOST_URL                                   = "https://${var.appeals_service_public_url}"
        MICROSOFT_PROVIDER_AUTHENTICATION_SECRET   = local.secret_refs["appeals-microsoft-provider-authentication-secret"]
        PDF_SERVICE_API_URL                        = "https://pins-app-${var.service_name}-pdf-api-${var.resource_suffix}.azurewebsites.net"
        PINS_FEATURE_FLAG_AZURE_ENDPOINT           = local.secret_refs["appeals-app-config-endpoint"]
        PINS_FEATURE_FLAG_AZURE_CONNECTION_STRING  = local.secret_refs["appeals-app-config-connection-string"]
        PORT                                       = "3000"
        SESSION_KEY                                = local.secret_refs["appeals-wfe-session-key"]
        SESSION_MONGODB_COLLECTION                 = "sessions"
        SESSION_MONGODB_DB_NAME                    = "forms-web-app"
        SESSION_MONGODB_URL                        = local.secret_refs["appeals-mongo-db-connection-string"]
        SUBDOMAIN_OFFSET                           = "3"
        USE_SECURE_SESSION_COOKIES                 = true
      }
    }

    #====================================
    # Backends
    #====================================

    appeals_service_api = {
      app_name                        = "appeals-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "appeal-planning-decision/appeals-service-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING                                       = local.secret_refs["appeals-app-insights-connection-string"]
        APP_APPEALS_BASE_URL                                                        = "https://${var.appeals_service_public_url}"
        BLOB_STORAGE_CONNECTION_STRING                                              = local.secret_refs["appeals-documents-primary-blob-connection-string"]
        DOCS_API_PATH                                                               = "/opt/app/api"
        DOCUMENTS_SERVICE_API_TIMEOUT                                               = var.api_timeout
        DOCUMENTS_SERVICE_API_URL                                                   = "https://pins-app-${var.service_name}-documents-api-${var.resource_suffix}.azurewebsites.net"
        FEATURE_FLAG_NEW_APPEAL_JOURNEY                                             = true
        HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                                  = true
        HORIZON_HAS_PUBLISHER_HOST                                                  = "${azurerm_servicebus_namespace.horizon.name}.servicebus.windows.net"
        HORIZON_HAS_PUBLISHER_HOSTNAME                                              = "${azurerm_servicebus_namespace.horizon.name}.servicebus.windows.net"
        HORIZON_HAS_PUBLISHER_PASSWORD                                              = local.secret_refs["appeals-horizon-pub-password"]
        HORIZON_HAS_PUBLISHER_PORT                                                  = "5671"
        HORIZON_HAS_PUBLISHER_QUEUE                                                 = azurerm_servicebus_queue.horizon_householder_appeal_publish.name
        HORIZON_HAS_PUBLISHER_RECONNECT_LIMIT                                       = "5"
        HORIZON_HAS_PUBLISHER_TRANSPORT                                             = "tls"
        HORIZON_HAS_PUBLISHER_USERNAME                                              = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.name
        LOGGER_LEVEL                                                                = var.logger_level
        LPA_DATA_PATH                                                               = "/opt/app/data/lpa-list.csv"
        LPA_TRIALIST_DATA_PATH                                                      = "/opt/app/data/lpa-trialists.json"
        MONGODB_AUTO_INDEX                                                          = true
        MONGODB_NAME                                                                = "appeals-service-api"
        MONGODB_URL                                                                 = local.secret_refs["appeals-mongo-db-connection-string"]
        NODE_ENV                                                                    = var.node_environment
        PINS_FEATURE_FLAG_AZURE_ENDPOINT                                            = local.secret_refs["appeals-app-config-endpoint"]
        PINS_FEATURE_FLAG_AZURE_CONNECTION_STRING                                   = local.secret_refs["appeals-app-config-connection-string"]
        SERVER_PORT                                                                 = "3000"
        SERVER_SHOW_ERRORS                                                          = true
        SERVER_TERMINATION_GRACE_PERIOD_SECONDS                                     = "0"
        SERVICE_BUS_HOSTNAME                                                        = "${var.back_office_service_bus_namespace_name}.servicebus.windows.net"
        SERVICE_BUS_ENABLED                                                         = var.appeals_api_service_bus_enabled
        SQL_CONNECTION_STRING                                                       = local.secret_refs["appeals-sql-server-connection-string-admin"]
        SRV_ADMIN_MONITORING_EMAIL                                                  = var.srv_admin_monitoring_email
        SRV_HORIZON_URL                                                             = var.horizon_url
        SRV_NOTIFY_API_KEY                                                          = local.secret_refs["appeals-srv-notify-api-key"]
        SRV_NOTIFY_BASE_URL                                                         = var.srv_notify_base_url
        SRV_NOTIFY_FAILURE_TO_UPLOAD_TO_HORIZON_TEMPLATE_ID                         = var.srv_notify_failure_to_upload_to_horizon_template_id
        SRV_NOTIFY_FINAL_COMMENT_SUBMISSION_CONFIRMATION_EMAIL_TEMPLATE_ID          = var.srv_notify_final_comment_submission_confirmation_email_template_id
        SRV_NOTIFY_FULL_APPEAL_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID          = var.srv_notify_full_appeal_confirmation_email_to_appellant_template_id
        SRV_NOTIFY_FULL_APPEAL_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID       = var.srv_notify_full_appeal_received_notification_email_to_lpa_template_id
        SRV_NOTIFY_SAVE_AND_RETURN_CONTINUE_WITH_APPEAL_TEMPLATE_ID                 = var.srv_notify_save_and_return_continue_with_appeal_template_id
        SRV_NOTIFY_SAVE_AND_RETURN_ENTER_CODE_INTO_SERVICE_TEMPLATE_ID              = var.srv_notify_save_and_return_enter_code_into_service_template_id
        SRV_NOTIFY_CONFIRM_EMAIL_TEMPLATE_ID                                        = var.srv_notify_confirm_email_template_id
        SRV_NOTIFY_SERVICE_ID                                                       = var.srv_notify_service_id
        SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID    = var.srv_notify_appeal_submission_confirmation_email_to_appellant_template_id
        SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID = var.srv_notify_appeal_submission_received_notification_email_to_lpa_template_id
        SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID                                   = var.srv_notify_start_email_to_lpa_template_id
        SRV_NOTIFY_LPA_DASHBOARD_INVITE_TEMPLATE_ID                                 = var.srv_notify_lpa_dashboard_invite_template_id
        STORAGE_CONTAINER_NAME                                                      = var.appeal_documents_storage_container_name
        TASK_SUBMIT_TO_HORIZON_CRON_STRING                                          = var.task_submit_to_horizon_cron_string
        TASK_SUBMIT_TO_HORIZON_TRIGGER_ACTIVE                                       = var.task_submit_to_horizon_trigger_active
      }
    }

    appeal_documents_service_api = {
      app_name                        = "documents-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "appeal-planning-decision/documents-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING     = local.secret_refs["appeals-app-insights-connection-string"]
        BLOB_STORAGE_CONNECTION_STRING            = local.secret_refs["appeals-documents-primary-blob-connection-string"]
        DOCS_API_PATH                             = "/opt/app/api"
        FILE_MAX_SIZE_IN_BYTES                    = "15000000"
        FILE_UPLOAD_PATH                          = "/tmp/upload"
        LOGGER_LEVEL                              = var.logger_level
        MONGODB_AUTO_INDEX                        = true
        MONGODB_DB_NAME                           = "documents-service-api"
        MONGODB_URL                               = local.secret_refs["appeals-mongo-db-connection-string"]
        NODE_ENV                                  = var.node_environment
        PINS_FEATURE_FLAG_AZURE_ENDPOINT          = local.secret_refs["appeals-app-config-endpoint"]
        PINS_FEATURE_FLAG_AZURE_CONNECTION_STRING = local.secret_refs["appeals-app-config-connection-string"]
        SERVER_PORT                               = "4000",
        SERVER_SHOW_ERRORS                        = true
        STORAGE_CONTAINER_NAME                    = var.appeal_documents_storage_container_name
        STORAGE_UPLOAD_MAX_ATTEMPTS               = "3"
        STORAGE_UPLOAD_QUERY_LIMIT                = "5"
      }
    }

    pdf_service_api = {
      app_name                        = "pdf-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "appeal-planning-decision/pdf-api"
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      key_vault_access                = true
      outbound_vnet_connectivity      = false

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING   = local.secret_refs["appeals-app-insights-connection-string"]
        DOCS_API_PATH                           = "/opt/app/api"
        GOTENBERG_URL                           = "http://gotenberg:4000"
        LOGGER_LEVEL                            = var.logger_level
        NODE_ENV                                = var.node_environment
        SERVER_PORT                             = "3000"
        SERVER_SHOW_ERRORS                      = true
        SERVER_TERMINATION_GRACE_PERIOD_SECONDS = "0"
      }
    }

    clam_av_service_api = {
      app_name                        = "clamav-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.private_endpoint_enabled ? var.endpoint_subnet_id : null
      image_name                      = "appeal-planning-decision/clamav-api"
      integration_subnet_id           = var.integration_subnet_id
      inbound_vnet_connectivity       = var.private_endpoint_enabled
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        APPLICATIONINSIGHTS_CONNECTION_STRING = local.secret_refs["appeals-app-insights-connection-string"]
        CLAMAV_HOST                           = var.clamav_host
      }
    }
  }

  secrets_manual = [
    "appeals-app-config-endpoint",
    "appeals-microsoft-provider-authentication-secret",
    "appeals-srv-notify-api-key",
    "appeals-wfe-session-key"
  ]

  secrets_automated = [
    "appeals-app-config-connection-string",
    "appeals-app-insights-connection-string",
    "appeals-mongo-db-connection-string",
    "appeals-horizon-pub-password",
    "appeals-documents-primary-blob-connection-string",
    "appeals-sql-server-connection-string-admin"
  ]

  secret_names = concat(local.secrets_manual, local.secrets_automated)

  secret_refs = {
    for name in local.secret_names : name => "@Microsoft.KeyVault(SecretUri=${var.key_vault_uri}secrets/${name}/)"
  }
}
