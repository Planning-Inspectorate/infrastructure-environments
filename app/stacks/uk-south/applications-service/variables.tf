variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority (P4) alerts"
  type        = string
}

variable "activate_planned_outage" {
  description = "A flag to indicate whether or not to activate the planned outage page"
  type        = bool
  default     = false
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

variable "back_office_integration_get_application_case_references" {
  description = "list of case references (comma separated) that the application data is retrieved from back office"
  type        = string
}

variable "back_office_integration_get_documents_case_references" {
  description = "list of case references (comma separated) that document data is retrieved from back office"
  type        = string
}

variable "back_office_integration_get_timetable_case_references" {
  description = "list of case references (comma separated) that timetable data is retrieved from back office"
  type        = string
}

variable "back_office_integration_get_advice_case_references" {
  description = "list of case references (comma separated) that advice data is retrieved from back office"
  type        = string
}

variable "back_office_integration_post_interested_party_case_references" {
  description = "list of case references (comma separated) that use back office for interested party registration"
  type        = string
}

variable "back_office_integration_post_submissions_case_references" {
  description = "list of case references (comma separated) that use back office for submissions"
  type        = string
}

variable "back_office_service_bus_namespace_name" {
  description = "Namespace of Back Office Service Bus instance"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = "tbc"
}

variable "back_office_service_bus_nsip_project_topic_id" {
  description = "ID for the nsip-project topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_nsip_document_topic_id" {
  description = "ID for the nsip-document topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_register_nsip_subscription_topic_id" {
  description = "ID for the register-nsip-subscription topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_register_representation_topic_id" {
  description = "ID for the register-representation topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_nsip_project_update_topic_id" {
  description = "ID for the nsip-project-update topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_nsip_representation_topic_id" {
  description = "ID for the nsip-representation topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_service_bus_nsip_exam_timetable_topic_id" {
  description = "ID for the nsip-exam-timetable topic"
  type        = string
  default     = ""
}

variable "back_office_service_bus_nsip_advice_topic_id" {
  description = "ID for the nsip-advice topic"
  type        = string
  default     = ""
}

variable "back_office_service_bus_nsip_service_user_topic_id" {
  description = "ID for the nsip-service-user topic"
  type        = string
  default     = ""
}

variable "back_office_service_bus_deadline_submission_topic_id" {
  description = "ID for the deadline-submission topic"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_submissions_storage_container_name" {
  description = "URL for Back Office submissions storage container"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_submissions_storage_container_resource_manager_id" {
  description = "Back office submissions container resource_manager_id"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
}

variable "back_office_submissions_storage_account_name" {
  description = "Back office submissions storage account name"
  type        = string
  # TODO: ASB-1171 DR strategy to figure out how to handle service bus fail-over
  default = ""
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

variable "feature_home_page" {
  description = "Feature toggle to enable/disable routing to the home page"
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

variable "feature_allow_get_updates" {
  description = "Feature toggle for get updates"
  type        = string
}

variable "feature_allow_project_information" {
  description = "Feature toggle for project information"
  type        = string
}

variable "feature_allow_have_your_say" {
  description = "Feature toggle to enable/disable have your say"
  type        = string
}

variable "feature_application_insights" {
  description = "Feature toggle to enable/disable application insights"
  type        = string
}

variable "feature_enable_generalised_form_sanitisation" {
  description = "Feature toggle to enable/disable generalised form sanitisation"
  type        = string
}

variable "function_storage_name" {
  description = "Name of the Storage Account used for Function Apps"
  type        = string
}

variable "function_storage_primary_access_key" {
  description = "Primary access key of the Storage Account used for Function Apps"
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

variable "planned_outage_resume_text" {
  description = "Optional text to be displayed when planned outage page is active"
  type        = string
}

variable "primary_applications_sql_server_id" {
  description = "ID of the primary (ukw) Applications SQL Server"
  type        = string
}

variable "primary_applications_sql_database_id" {
  description = "ID of the primary (ukw) Applications SQL database"
  type        = string
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

variable "srv_notify_subscription_create_email_template_id" {
  description = "The template ID for the subscription create email"
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

variable "project_migration_case_references" {
  description = "Specifies the case references to migrate to the new project information page"
  type        = string
}
