variable "action_group_ids" {
  description = "The IDs of the Azure Monitor action groups for different alert types"
  type = object({
    tech            = string,
    service_manager = string,
    iap             = string,
    its             = string,
    info_sec        = string
  })
}

variable "action_group_names" {
  description = "The names of the Azure Monitor action groups for different alert types"
  type = object({
    tech            = string,
    service_manager = string,
    iap             = string,
    its             = string,
    info_sec        = string
  })
}

variable "api_timeout" {
  description = "The timeout in milliseconds for API calls in the frontend apps"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "comment_planning_appeal_public_url" {
  description = "The public URL for the Comment Planning Appeal frontend web app"
  type        = string
}

variable "integration_functions_app_service_plan_id" {
  description = "The id of the common integration functions app service plan"
  type        = string
}

variable "appeals_feature_flags" {
  description = "A list of maps describing feature flags to be saved in the App Configuration store"
  type        = list(any)
}

variable "appeals_service_public_url" {
  description = "The public URL for the Appeals Service frontend web app"
  type        = string
}

variable "clamav_subnet_id" {
  description = "The id of the subnet to use for clamav"
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

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "cosmosdb_subnet_id" {
  description = "The ID of the VNet in the primary location"
  type        = string
}

variable "database_public_access_enabled" {
  description = "A switch indicating if databases should have public access enabled"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
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

variable "internal_dns_name" {
  description = "The name of the internal private dns zone"
  type        = string
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
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

variable "primary_location" {
  description = "The primary location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
}

variable "secondary_location" {
  description = "The secondary location resources are deployed to in slug format e.g. 'uk-west'"
  type        = string
  default     = "uk-south"
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

variable "srv_notify_base_url" {
  description = "The base URL for the Notifications service"
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

variable "srv_notify_appeal_submission_confirmation_email_to_appellant_template_id_v1_1" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_has_appeal_submission_confirmation_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_full_appeal_submission_confirmation_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appeal_submission_notification_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appeal_received_notification_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appeal_submission_received_notification_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_lpa_statement_submission_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_lpa_final_comment_submission_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appellant_final_comment_submission_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appellant_proof_evidence_submission_email_to_appellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appellant_login_confirm_registration_template_id" {
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

variable "srv_notify_ip_comment_submission_confirmation_email_to_ip_template_id" {
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

variable "deploy_interested_parties" {
  description = "A switch to determine if the interested parties app service should be deployed"
  type        = bool
  default     = false
}

variable "appeals_api_service_bus_enabled" {
  description = "A switch to determine if service bus integration is enabled for the appeals api"
  type        = bool
  default     = true
}

variable "appeals_feature_back_office_subscriber_enabled" {
  description = "Feature toggle for appeals back office to front office service topic susbcription using azure functions"
  type        = bool
  default     = false
}

variable "common_integration_functions_subnet_id" {
  description = "The id of the subnet for common integration functions app service plan"
  type        = string
}

variable "sql_server_azuread_administrator" {
  description = "Azure AD details of database administrator user/group"
  type        = map(string)
}

variable "sql_database_configuration" {
  description = "A map of database configuration options"
  type        = map(string)
}

variable "appeals_frontend_file_upload_debug_logging_enabled" {
  description = "Toggles debug logging for file upload middleware"
  type        = bool
  default     = true
}

variable "comments_enabled" {
  description = "A switch to determine if commenting on an appeal journeys are enabled"
  type        = bool
  default     = false
}

variable "dashboards_enabled" {
  description = "A switch to determine if dashboards are enabled for LPA and appellant"
  type        = bool
  default     = false
}

variable "rule_6_enabled" {
  description = "A switch to determine if rule 6 journeys are enabled"
  type        = bool
  default     = false
}

variable "service_bus_config" {
  description = "service bus configuration"
  type = object({
    default_topic_ttl            = string
    bo_internal_subscription_ttl = string
    bo_subscription_ttl          = string
    fo_subscription_ttl          = string
  })
}
