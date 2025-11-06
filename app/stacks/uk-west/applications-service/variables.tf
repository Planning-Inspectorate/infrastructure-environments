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
    applications-fo-tech            = string,
    applications-fo-service-manager = string,
    iap                             = string,
    its                             = string,
    info_sec                        = string
  })
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

variable "applications_easy_auth_config" {
  description = "Easy Authentication configuration for the web front end"
  type = object({
    client_id        = string
    web_auth_enabled = bool
    application_id   = string
  })
}

variable "applications_service_vpn_gateway_shared_key" {
  description = "The applications service virtual network gateway shared key"
  sensitive   = true
  type        = string
}

variable "apps_config" {
  description = "Application configuration settings"
  type = object({
    app_service_plan = object({
      sku                      = string
      per_site_scaling_enabled = bool
      worker_count             = number
      zone_balancing_enabled   = bool
    })
  })
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

variable "back_office_service_bus_nsip_document_topic_id" {
  description = "ID for the nsip-document topic"
  type        = string
}

variable "back_office_service_bus_register_nsip_subscription_topic_id" {
  description = "ID for the register-nsip-subscription topic"
  type        = string
}

variable "back_office_service_bus_register_representation_topic_id" {
  description = "ID for the register-representation topic"
  type        = string
}

variable "back_office_service_bus_nsip_project_update_topic_id" {
  description = "ID for the nsip-project-update topic"
  type        = string
}

variable "back_office_service_bus_nsip_representation_topic_id" {
  description = "ID for the nsip-representation topic"
  type        = string
}

variable "back_office_service_bus_nsip_exam_timetable_topic_id" {
  description = "ID for the nsip-exam-timetable topic"
  type        = string
}

variable "back_office_service_bus_nsip_advice_topic_id" {
  description = "ID for the nsip-advice topic"
  type        = string
}

variable "back_office_service_bus_nsip_service_user_topic_id" {
  description = "ID for the nsip-service-user topic"
  type        = string
}

variable "back_office_service_bus_deadline_submission_topic_id" {
  description = "ID for the deadline-submission topic"
  type        = string
}

variable "back_office_submissions_storage_container_name" {
  description = "URL for Back Office submissions storage container"
  type        = string
}

variable "back_office_submissions_storage_container_resource_manager_id" {
  description = "Back office submissions container resource_manager_id"
  type        = string
}

variable "back_office_submissions_storage_account_name" {
  description = "Back office submissions storage account name"
  type        = string
}

variable "back_office_integration_get_applications" {
  description = "indicate if applications are retrieved from BO or NI or MERGE"
  type        = string
}

variable "back_office_integration_case_references" {
  description = "list of case references (comma separated) that use back office"
  type        = string
}

variable "client_affinity_enabled" {
  description = "Should session affinity be enabled?"
  type        = bool
  default     = null
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
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

variable "document_storage_api_host" {
  description = "Azure blob storage URL"
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

variable "feature_primary_navigation" {
  description = "Feature toggle to enable/disable display of primary navigation"
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

variable "feature_allow_welsh_translation" {
  description = "Feature toggle activating Welsh translation."
  type        = string
}

variable "feature_allow_project_information" {
  description = "Feature toggle for project information"
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

variable "feature_general_s51_bo" {
  description = "Feature toggle to enable/disable general s51 from back office"
  type        = string
}

variable "feature_register_of_advice" {
  description = "Feature toggle to enable/disable changes to register of advice"
  type        = string
}

variable "feature_allow_welsh_cases" {
  description = "Feature toggle to enable/disable Welsh cases"
  type        = string
}

variable "feature_enable_projects_map" {
  description = "Feature toggle to enable/disable projects map"
  type        = string
}

variable "global_banner_text" {
  description = "Text to be displayed in the global banner across all pages in the application. If empty, no banner is shown."
  type        = string
  default     = ""
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

variable "log_daily_cap_gb" {
  description = "Daily log ingestion cap in GB"
  type        = number
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "monitoring_config" {
  description = "Config for monitoring"
  type = object({
    app_insights_web_test_enabled = bool
  })
  default = {
    app_insights_web_test_enabled = false
  }
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

variable "open_registration_case_references" {
  description = "Case reference list for temporarily re-opened registrations period"
  type        = string
}

variable "planned_outage_resume_text" {
  description = "Optional text to be displayed when planned outage page is active"
  type        = string
}

variable "private_endpoint_enabled" {
  description = "A switch to determine if Private Endpoint should be enabled for backend App Services"
  type        = bool
  default     = true
}

variable "redis_cache_configuration" {
  description = "Redis configuration options"
  type = object({
    family   = string
    capacity = number
    sku_name = string
  })
}

variable "srv_notify_base_url" {
  description = "The base URL for the Notifications service"
  type        = string
}

variable "srv_notify_ip_registration_confirmation_email_to_ip_template_id" {
  description = "The template ID for the IP registration confirmation email"
  type        = string
}

variable "srv_notify_ip_registration_confirmation_email_to_ip_template_id_welsh" {
  description = "The template ID for the IP registration confirmation email - bilingual for Welsh region projects"
  type        = string
}

variable "srv_notify_submission_complete_email_template_id" {
  description = "The template ID for the submission complete email"
  type        = string
}

variable "srv_notify_submission_complete_email_template_id_welsh" {
  description = "The template ID for the submission complete email - bilingual for Welsh region projects"
  type        = string
}

variable "srv_notify_subscription_create_email_template_id" {
  description = "The template ID for the subscription create email"
  type        = string
}

variable "srv_notify_subscription_create_email_template_id_welsh" {
  description = "The template ID for the subscription create email - bilingual for Welsh region projects"
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

variable "service_bus_config" {
  description = "service bus configuration"
  type = object({
    default_topic_ttl            = string
    bo_internal_subscription_ttl = string
    bo_subscription_ttl          = string
    fo_subscription_ttl          = string
  })
}
