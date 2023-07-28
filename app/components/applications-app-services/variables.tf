variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
  type        = string
}

variable "api_timeout" {
  description = "The timeout in milliseconds for API calls in the frontend apps"
  type        = string
}

variable "app_service_private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "applications_service_public_url" {
  description = "The public URL for the Applications Service frontend web app"
  type        = string
}

variable "applications_service_redis_connection_string_secret_name" {
  description = "Name of the secret in Key Vault that stores the redis connection string"
  type        = string
}

variable "applications_sql_server_connection_string" {
  description = "Connection string for applications service sql server"
  type        = string
}

variable "applications_sql_server_connection_string_jbdc" {
  description = "Connection string for applications service sql server in JBDC format"
  type        = string
}

variable "back_office_integration_get_documents_case_references" {
  description = "list of case references (comma separated) that document data is retrieved from back office"
  type        = string
}

variable "back_office_integration_get_application_case_references" {
  description = "list of case references (comma separated) that the application data is retrieved from back office"
  type        = string
}

variable "back_office_service_bus_namespace_name" {
  description = "Namespace of Back Office Service Bus instance"
  type        = string
}

variable "back_office_service_bus_nsip_project_topic_id" {
  description = "ID for the nsip-project topic"
  type        = string
}

variable "back_office_service_bus_nsip_documents_topic_id" {
  description = "ID for the nsip-document topic"
  type        = string
}

variable "back_office_service_bus_nsip_project_update_topic_id" {
  description = "ID for the nsip-project-update topic"
  type        = string
}

variable "back_office_service_bus_register_nsip_subscription_topic_id" {
  description = "ID for the register-nsip-subscription topic"
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

variable "google_analytics_id" {
  description = "The id used to connect the frontend app to Google Analytics"
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

variable "function_storage_primary_access_key" {
  description = "Access key for the Azure Storage Account for Function Apps"
  type        = string
}

variable "function_storage_name" {
  description = "Name of the Azure Storage Account for Function Apps"
  type        = string
}

variable "srv_notify_base_url" {
  description = "The base URL for the Notifications service"
  type        = string
}

variable "srv_notify_ip_registration_confirmation_email_to_ip_template_id" {
  description = "The template ID for the IP registration confirmation email"
  type        = string
}

variable "srv_notify_magic_link_email_template_id" {
  description = "The template ID for the magic link email"
  type        = string
}

variable "srv_notify_submission_complete_email_template_id" {
  description = "The template ID for the submission complete email"
  type        = string
}

variable "srv_notify_subscription_create_email_template_id" {
  description = "The template ID for the subscription create email"
  type        = string
}

variable "srv_notify_service_id" {
  description = "The ID of the Notifications service"
  type        = string
}

variable "private_beta_v1_routes_only" {
  description = "Feature toggle for limiting web app routes to Private Beta V1 functionality only"
  type        = string
}

variable "feature_save_and_exit_option" {
  description = "Feature toggle for showing the save and exit option on registration form"
  type        = string
}

variable "feature_show_affected_area_section" {
  description = "Feature toggle for showing the affected area section on project page"
  type        = string
}

variable "feature_hide_project_timeline_link" {
  description = "Feature toggle to show / hide the project timeline link on project overview nav bar"
  type        = string
}

variable "feature_allow_document_library" {
  description = "Feature toggle for limiting the web app routes to document library"
  type        = string
}

variable "feature_allow_examination_timetable" {
  description = "Feature toggle for the activation of examination timetable routes and links"
  type        = string
}

variable "feature_allow_representation" {
  description = "Feature toggle for limiting the web app routes to representation"
  type        = string
}

variable "feature_redis_session_store" {
  description = "Feature toggle for using redis to store session data as opposed to default in-memory store"
  type        = string
}

variable "feature_back_office_subscriber_enabled" {
  description = "Temporary flag to enable/disable Back Office subscription integration. Always disabled for uk-south for now."
  type        = bool
  default     = false
}

variable "feature_enabled_content_security_policy" {
  description = "Feature toggle to enable/disable content security policy"
  type        = string
}

variable "feature_allow_section_51" {
  description = "Feature toggle to section 51"
  type        = string
}

variable "feature_allow_get_updates" {
  description = "Feature toggle for get updates"
  type        = string
}

variable "feature_enable_generalised_form_sanitisation" {
  description = "Feature toggle to enable/disable generalised form sanitisation"
  type        = string
}

variable "feature_allow_have_your_say" {
  description = "Feature toggle to enable/disable have your say"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "documents_host" {
  description = "Specifies environment specific Wordpress CMS URL Prefix"
  type        = string
}
