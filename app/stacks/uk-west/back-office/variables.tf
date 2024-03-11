variable "action_group_ids" {
  description = "The IDs of the Azure Monitor action groups for different alert types"
  type = object({
    bo_appeals_tech                 = string,
    bo_appeals_service_manager      = string,
    bo_applications_tech            = string,
    bo_applications_service_manager = string,
    iap                             = string,
    its                             = string,
    info_sec                        = string
  })
}

variable "action_group_ids_map" {
  description = "All the Azure Monitor action group IDs"
  type        = map(string)
}

variable "api_key_vault_authorization_enabled" {
  description = "Whether or not Key Vault is used to access secrets from the app"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
  type        = string
  default     = null
}

variable "azuread_appeals_case_officer_group_id" {
  description = "The Azure AD group ID for Appeals Back Office case officers"
  type        = string
  default     = null
}

variable "azuread_appeals_inspector_group_id" {
  description = "The Azure AD group ID for Appeals Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_appeals_cs_team_group_id" {
  description = "The Azure AD group ID for Appeals Back Office CS Team"
  type        = string
  default     = null
}

variable "azuread_appeals_legal_team_group_id" {
  description = "The Azure AD group ID for Appeals Back Office Legal Team"
  type        = string
  default     = null
}


variable "azuread_applications_caseteam_group_id" {
  description = "The Azure AD group ID for Applications Back Office case team"
  type        = string
  default     = null
}

variable "azuread_applications_inspector_group_id" {
  description = "The Azure AD group ID for Applications Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_applications_case_admin_officer_group_id" {
  description = "The Azure AD group ID for Applications Back Office case admin officers"
  type        = string
  default     = null
}

variable "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
  type        = string
}

variable "back_office_clamav_subnet_id" {
  description = "Integration subnet for the clamav container"
  type        = string
}

variable "back_office_public_url" {
  description = "The public URL for the Back Office frontend web app"
  type        = string
}

variable "back_office_public_url_new" {
  description = "The new public URL for the Back Office frontend web app"
  type        = string
  default     = null
}

variable "back_office_appeals_public_url" {
  description = "The public URL for the Back Office Appeals frontend web app"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  type        = map(string)
}

variable "common_vnet_id" {
  description = "The common infrastructure virtual network id"
  type        = string
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

variable "database_public_access_enabled" {
  description = "A switch indicating if databases should have public access enabled"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "health_check_path" {
  description = "The path of the service's health check endpoint"
  type        = string
  default     = "/health"
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

variable "service_bus_failover_enabled" {
  default     = false
  description = "A switch to determine if Service Bus failover is enabled requiring the Premium SKU"
  type        = bool
}

variable "sql_database_configuration" {
  description = "A map of database configuration options"
  type        = map(string)
}

variable "sql_server_azuread_administrator" {
  description = "A map describing the AzureAD account used for the SQL server administrator"
  type        = map(string)
}

variable "feature_service_bus_enabled" {
  description = "Whether or not Service Bus events are enabled"
  type        = string
}

variable "feature_appeal_broadcasts_enabled" {
  description = "Whether or not Service Bus events are enabled on BO Appeals"
  type        = string
}

variable "feature_document_scanning_enabled" {
  description = "Whether or not Document Scanning is enabled"
  type        = bool
}

variable "notify_subscribers_function_gov_notify_template_id" {
  description = "Notify Subscribers Function - GovNotify Template ID"
  type        = string
}

variable "applications_front_office_web_url" {
  description = "Applications Front Office Web URL"
  type        = string
}

variable "back_office_applications_log_level_file" {
  description = "Log level for the server.log file - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_applications_log_level_stdout" {
  description = "Log level for stdout - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_appeals_log_level_file" {
  description = "Log level for the server.log file - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "back_office_appeals_log_level_stdout" {
  description = "Log level for stdout - trace, debug, info, warn, error, fatal, silent"
  type        = string
}

variable "redis_cache_configuration" {
  description = "A map of redis configuration options"
  type        = map(string)
}

variable "odw_synapse_integration_enabled" {
  description = "Whether or not Synapse Migration Integration is enabled"
  type        = bool
  default     = false
}

variable "alert_recipients" {
  description = "The email recipients for monitoring alerts"
  type        = map(list(string))
}

variable "horizon_url" {
  description = "The URL used to connect to Horizon"
  type        = string
}

variable "mock_horizon" {
  description = "Whether or not to mock Horizon"
  type        = bool
}

variable "sb_topic_names" {
  description = "service bus topic names"
  type = object({
    common = object({ service_user = string }),
    applications = object({
      commands = object({
        register_nsip_subscription = string
        register_representation    = string
        deadline_submission_topic  = string
        deadline_submission_result = string
      })
      events = object({
        nsip_project        = string
        nsip_project_update = string
        nsip_documents      = string
        folders             = string
        nsip_subscription   = string
        nsip_exam_timetable = string
        nsip_representation = string
        nsip_s51_advice     = string
      })
    })
    appeals = object({
      commands = object({
        appellant_submission    = string
        lpa_response_submission = string
        listed_building         = string
      })
      events = object({
        case             = string
        document         = string
        document_to_move = string
      })
    })
  })
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

variable "back_office_document_storage_domain" {
  description = "Custom domain for document storage"
  type        = string
}
