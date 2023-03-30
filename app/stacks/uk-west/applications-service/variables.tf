variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority (P4) alerts"
  type        = string
}

variable "api_timeout" {
  description = "The timeout in milliseconds for API calls in the frontend apps"
  type        = string
}

variable "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
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

variable "back_office_service_bus_namespace_name" {
  description = "Namespace of Back Office Service Bus instance"
  type        = string
}

variable "back_office_service_bus_nsip_project_topic_id" {
  description = "ID for the nsip-project topic"
  type        = string
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_vnet_id" {
  description = "The common infrastructure virtual network id"
  type        = string
}

variable "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  type        = map(string)
}

variable "common_vnet_gateway_id" {
  description = "The id of the common infrastructure virtual network gateway"
  type        = string
}

variable "common_vnet_name" {
  description = "The common infrastructure virtual network name"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "database_public_access_enabled" {
  description = "Specifies whether sql db is exposed over internet or private network only"
  type        = bool
  default     = false
}

variable "documents_host" {
  description = "Specifies environment specific Wordpress CMS URL Prefix"
  type        = string
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
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

variable "feature_enabled_content_security_policy" {
  description = "Feature toggle to enable/disable content security policy"
  type        = string
}

variable "feature_allow_section_51" {
  description = "Feature toggle to section 51"
  type        = string
}

variable "feature_allow_have_your_say" {
  description = "Feature toggle to enable/disable have your say"
  type        = string
}

variable "feature_enable_generalised_form_sanitisation" {
  description = "Feature toggle to enable/disable generalised form sanitisation"
  type        = string
}

variable "google_analytics_id" {
  description = "The id used to connect the frontend app to Google Analytics"
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

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
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

variable "national_infrastructure_gateway_ip" {
  description = "The public IP address of the National Infrastructure gateway endpoint"
  type        = string
}

variable "national_infrastructure_vnet_address_space" {
  description = "The address space advertised by the National Infrastructure gateway endpoint"
  type        = list(string)
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

variable "srv_notify_service_id" {
  description = "The ID of the Notifications service"
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

variable "private_beta_v1_routes_only" {
  description = "Feature toggle for limiting web app routes to Private Beta V1 functionality only"
  type        = string
}
