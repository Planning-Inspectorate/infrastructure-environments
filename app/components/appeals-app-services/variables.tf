variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
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

variable "integration_functions_app_service_plan_id" {
  description = "The id of the integration functions app service plan"
  type        = string
}

variable "app_service_private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
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

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "endpoint_subnet_id" {
  description = "The id of the private endpoint subnet the app service is linked to for ingress traffic"
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

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "common_integration_functions_subnet_id" {
  description = "The id of the subnet for common integration functions app service plan"
  type        = string
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
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Azure Monitor Log Analytics Workspace"
  type        = string
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

variable "resource_group_id" {
  description = "The ID of the resource group that will contain the App Services"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Azure App Services are part of"
  type        = string
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

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
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
