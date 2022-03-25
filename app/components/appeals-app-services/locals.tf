locals {
  app_services = {
    #====================================
    # Frontends
    #====================================

    appeals_frontend = {
      app_name                   = "appeals-wfe"
      inbound_vnet_connectivity  = false
      integration_subnet_id      = var.integration_subnet_id
      image_name                 = "appeal-planning-decisions/forms-web-app"
      key_vault_access           = false
      outbound_vnet_connectivity = true

      app_settings = {
        APPEALS_SERVICE_API_TIMEOUT                = var.api_timeout
        APPEALS_SERVICE_API_URL                    = "https://pins-app-${var.service_name}-appeals-api-${var.resource_suffix}.azurewebsites.net"
        DOCS_API_PATH                              = "/opt/app/api"
        DOCUMENTS_SERVICE_API_TIMEOUT              = var.api_timeout
        DOCUMENTS_SERVICE_API_URL                  = "https://pins-app-${var.service_name}-documents-api-${var.resource_suffix}.azurewebsites.net/"
        FEATURE_FLAG_GOOGLE_TAG_MANAGER            = true
        FEATURE_FLAG_NEW_APPEAL_JOURNEY            = true
        FILE_UPLOAD_DEBUG                          = true
        FILE_UPLOAD_MAX_FILE_SIZE_BYTES            = "15000000"
        FILE_UPLOAD_TMP_PATH                       = "/tmp"
        FILE_UPLOAD_USE_TEMP_FILES                 = true
        GOOGLE_ANALYTICS_ID                        = var.google_analytics_id
        GOOGLE_TAG_MANAGER_ID                      = var.google_tag_manager_id
        HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION = true
        HOST_URL                                   = "https://${var.appeals_service_public_url}"
        MICROSOFT_PROVIDER_AUTHENTICATION_SECRET   = var.key_vault_secret_refs["microsoft-provider-authentication-secret"]
        PDF_SERVICE_API_URL                        = "https://pins-app-${var.service_name}-pdf-api-${var.resource_suffix}.azurewebsites.net"
        PORT                                       = "3000"
        SESSION_KEY                                = "some_key"
        SESSION_MONGODB_COLLECTION                 = "sessions"
        SESSION_MONGODB_DB_NAME                    = "forms-web-app"
        SESSION_MONGODB_URL                        = var.cosmosdb_connection_string
        SUBDOMAIN_OFFSET                           = "3"
        USE_SECURE_SESSION_COOKIES                 = false
      }
    }
    #====================================
    # Backends
    #====================================

    appeals_service_api = {
      app_name                        = "appeals-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.endpoint_subnet_id
      image_name                      = "appeal-planning-decisions/appeals-service-api"
      inbound_vnet_connectivity       = true
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = true
      outbound_vnet_connectivity      = true

      app_settings = {
        APP_APPEALS_BASE_URL                                                        = "https://${var.appeals_service_public_url}"
        DOCS_API_PATH                                                               = "/opt/app/api"
        DOCUMENTS_SERVICE_API_TIMEOUT                                               = "10000"
        DOCUMENTS_SERVICE_API_URL                                                   = "https://pins-app-${var.service_name}-documents-api-${var.resource_suffix}.azurewebsites.net"
        FEATURE_FLAG_NEW_APPEAL_JOURNEY                                             = true
        HORIZON_HAS_PUBLISHER_ATTEMPT_RECONNECTION                                  = true
        HORIZON_HAS_PUBLISHER_HOST                                                  = "${azurerm_servicebus_namespace.horizon.name}.servicebus.windows.net"
        HORIZON_HAS_PUBLISHER_PASSWORD                                              = azurerm_servicebus_namespace_authorization_rule.horizon_function_apps.primary_connection_string
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
        MONGODB_URL                                                                 = var.cosmosdb_connection_string
        NODE_ENV                                                                    = var.node_environment
        SERVER_PORT                                                                 = "3000"
        SERVER_SHOW_ERRORS                                                          = true
        SERVER_TERMINATION_GRACE_PERIOD_SECONDS                                     = "0"
        SRV_NOTIFY_API_KEY                                                          = var.key_vault_secret_refs["srv-notify-api-key"]
        SRV_NOTIFY_APPEAL_SUBMISSION_CONFIRMATION_EMAIL_TO_APPELLANT_TEMPLATE_ID    = var.srv_notify_appeal_submission_confirmation_email_to_apellant_template_id
        SRV_NOTIFY_APPEAL_SUBMISSION_RECEIVED_NOTIFICATION_EMAIL_TO_LPA_TEMPLATE_ID = var.srv_notify_appeal_submission_received_notification_email_to_lpa_template_id
        SRV_NOTIFY_BASE_URL                                                         = var.srv_notify_base_url
        SRV_NOTIFY_EMAIL_REPLYTO_ID_START_EMAIL_TO_LPA                              = var.srv_notify_email_reply_to_id_start_email_to_lpa_template_id
        SRV_NOTIFY_SERVICE_ID                                                       = var.srv_notify_service_id
        SRV_NOTIFY_START_EMAIL_TO_LPA_TEMPLATE_ID                                   = var.srv_notify_start_email_to_lpa_template_id
        SRV_NOTIFY_TEMPLATE_ID                                                      = var.srv_notify_template_id
      }
    }

    appeal_documents_service_api = {
      app_name                        = "documents-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.endpoint_subnet_id
      image_name                      = "appeal-planning-decisions/documents-api"
      inbound_vnet_connectivity       = true
      integration_subnet_id           = var.integration_subnet_id
      key_vault_access                = false
      outbound_vnet_connectivity      = true

      app_settings = {
        BLOB_STORAGE_CONNECTION_STRING = var.appeal_documents_primary_blob_connection_string
        DOCS_API_PATH                  = "/opt/app/api"
        FILE_MAX_SIZE_IN_BYTES         = "15000000"
        FILE_UPLOAD_PATH               = "/tmp/upload"
        LOGGER_LEVEL                   = var.logger_level
        MONGODB_AUTO_INDEX             = true
        MONGODB_DB_NAME                = "documents-service-api"
        MONGODB_URL                    = var.cosmosdb_connection_string
        NODE_ENV                       = var.node_environment
        SERVER_PORT                    = "4000",
        SERVER_SHOW_ERRORS             = true
        STORAGE_CONTAINER_NAME         = var.appeal_documents_storage_container_name
        STORAGE_UPLOAD_MAX_ATTEMPTS    = "3"
        STORAGE_UPLOAD_QUERY_LIMIT     = "5"
      }
    }

    pdf_service_api = {
      app_name                        = "pdf-api"
      app_service_private_dns_zone_id = var.app_service_private_dns_zone_id
      endpoint_subnet_id              = var.endpoint_subnet_id
      image_name                      = "appeal-planning-decisions/pdf-api"
      inbound_vnet_connectivity       = true
      key_vault_access                = false
      outbound_vnet_connectivity      = false

      app_settings = {
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
      endpoint_subnet_id              = var.endpoint_subnet_id
      image_name                      = "appeal-planning-decisions/clamav-api"
      inbound_vnet_connectivity       = true
      key_vault_access                = false
      outbound_vnet_connectivity      = false

      app_settings = {

      }
    }
  }
}
