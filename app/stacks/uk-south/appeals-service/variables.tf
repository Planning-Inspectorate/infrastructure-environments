variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority (P4) alerts"
  type        = string
}

variable "api_timeout" {
  description = "The timeout in milliseconds for API calls in the frontend apps"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "appeal_documents_primary_blob_connection_string" {
  description = "The Appeal Documents Storage Account blob connection string associated with the primary location"
  sensitive   = true
  type        = string
}

variable "appeal_documents_storage_container_name" {
  description = "The name of the Storage Container for Appeal Documents"
  type        = string
}

variable "appeals_service_public_url" {
  description = "The public URL for the Appeals Service frontend web app"
  type        = string
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  type        = map(string)
}

variable "common_vnet_name" {
  description = "The common infrastructure virtual network name"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "database_public_access_enabled" {
  description = "A switch indicating if databases should have public access enabled"
  type        = bool
  default     = false
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "cosmosdb_connection_string" {
  description = "The connection string used to connect to CosmosDB"
  sensitive   = true
  type        = string
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "function_apps_storage_account" {
  description = "The name of the storage account used by the Function Apps"
  type        = string
}

variable "function_apps_storage_account_access_key" {
  description = "The access key for the storage account"
  type        = string
  sensitive   = true
}

variable "google_analytics_id" {
  description = "The id used to connect the frontend app to Google Analytics"
  type        = string
}

variable "google_tag_manager_id" {
  description = "The id used to connect the frontend app to Google Tag Manager"
  type        = string
}

variable "horizon_url" {
  description = "The URL used to connect to Horizon"
  type        = string
}

variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "is_dr_deployment" {
  description = "A flag to indicate whether or not the infrastructure deployment is for a disaster recovery scenario"
  type        = bool
  default     = false
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-west'"
  type        = string
  default     = "uk-south"
}

variable "logger_level" {
  description = "The level of logging enabled for applications in the environment e.g. info"
  type        = string
  default     = "info"
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "private_endpoint_enabled" {
  description = "A switch to determine if Private Endpoint should be enabled for backend App Services"
  type        = bool
  default     = true
}

variable "srv_notify_base_url" {
  description = "The base URL for the Notifications service"
  type        = string
}

variable "srv_notify_full_appeal_confirmation_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_full_appeal_received_notification_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_save_and_return_continue_with_appeal_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_save_and_return_enter_code_into_service_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_confirm_email_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_service_id" {
  description = "The ID of the Notifications service"
  type        = string
}

variable "srv_notify_appeal_submission_confirmation_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appeal_submission_received_notification_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_start_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_lpa_dashboard_invite_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_admin_monitoring_email" {
  description = "Email for the Horizon failure team"
  type        = string
}

variable "srv_notify_failure_to_upload_to_horizon_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_final_comment_submission_confirmation_email_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "task_submit_to_horizon_cron_string" {
  description = "Task to submit to horizon cron string"
  type        = string
}

variable "task_submit_to_horizon_trigger_active" {
  description = "Task to submit to horizon trigger active"
  type        = string
}

variable "allow_testing_overrides" {
  description = "A switch to determine if testing overrides are enabled to allow easier manual testing"
  type        = bool
  default     = false
}

variable "appeals_api_service_bus_enabled" {
  description = "A switch to determine if service bus integration is enabled for the appeals api"
  type        = bool
  default     = true
}

variable "clamav_host" {
  description = "The host of the clam av service to use"
  type        = string
}


variable "back_office_service_bus_namespace_name" {
  description = "Namespace of Back Office Service Bus instance"
  type        = string
}
variable "service_bus_appeals_bo_case_topic_id" {
  description = "ID for the appeals case data topic"
  type        = string
}

variable "service_bus_appeals_fo_lpa_response_submission_topic_id" {
  description = "ID for the appeals fo front office LPA response submission topic"
  type        = string
}
variable "service_bus_appeals_fo_appellant_submission_topic_id" {
  description = "ID for the appeals fo front office LPA response submission topic"
  type        = string
}
variable "service_bus_appeals_bo_document_topic_id" {
  description = "ID for the appeals case data topic"
  type        = string
}

variable "service_bus_listed_building_topic_id" {
  description = "ID for the listed building topic"
  type        = string
}

variable "appeals_feature_back_office_subscriber_enabled" {
  description = "Feature toggle for appeals back office to front office service topic susbcription using azure functions"
  type        = bool
  default     = false
}

variable "integration_functions_app_service_plan_id" {
  description = "The id of the common integration functions app service plan"
  type        = string
}

variable "common_integration_functions_subnet_id" {
  description = "The id of the subnet for common integration functions app service plan"
  type        = string
}

variable "primary_appeals_sql_server_id" {
  description = "ID of the primary (ukw) Appeals SQL Server"
  type        = string
}

variable "primary_appeals_sql_database_id" {
  description = "ID of the primary (ukw) Appeals SQL database"
  type        = string
}

variable "primary_appeals_sql_database_name" {
  description = "Name of the primary (ukw) Appeals SQL database"
  type        = string
}

variable "sql_server_azuread_administrator" {
  description = "Azure AD details of database administrator user/group"
  type        = map(string)
}

variable "sql_server_password_admin" {
  description = "The SQL server administrator password"
  sensitive   = true
  type        = string
}

variable "sql_server_password_app" {
  description = "The SQL server app password"
  sensitive   = true
  type        = string
}

variable "sql_server_username_admin" {
  description = "The SQL server administrator username"
  sensitive   = true
  type        = string
}

variable "sql_server_username_app" {
  description = "The SQL server app username"
  sensitive   = true
  type        = string
}
