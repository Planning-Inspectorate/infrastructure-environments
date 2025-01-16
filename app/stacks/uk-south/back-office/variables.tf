variable "action_group_ids" {
  description = "The IDs of the Azure Monitor action groups for different alert types"
  type = object({
    bo_applications_tech            = string,
    bo_applications_service_manager = string,
    iap                             = string,
    its                             = string,
    info_sec                        = string
  })
}

variable "action_group_names" {
  description = "The names of the Azure Monitor action groups for different alert types"
  type = object({
    bo_applications_tech            = string,
    bo_applications_service_manager = string,
    iap                             = string,
    its                             = string,
    info_sec                        = string
  })
}

variable "api_key_vault_authorization_enabled" {
  description = "Whether or not Key Vault is used to access secrets from the app"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

#EasyAuth setting
variable "auth_config" {
  description = "Config for the Azure Easy Authentication"
  type = object({
    auth_enabled           = bool
    require_authentication = bool
    auth_client_id         = string
    auth_provider_secret   = string
    auth_tenant_endpoint   = string
    allowed_audiences      = string
    allowed_applications   = string
  })
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
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

variable "back_office_document_storage_api_host" {
  description = "The full failover URI to the storage account used for back office documents"
  type        = string
}

variable "back_office_integration_subnet_id" {
  description = "Integration subnet for back office anti-virus resources"
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

variable "back_office_sql_database" {
  description = "The ID of the Back Office SQL database"
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

variable "common_resource_group_name_ukw" {
  description = "The common infrastructure resource group name for UK west"
  type        = string
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

variable "database_public_access_enabled" {
  description = "A switch indicating if databases should have public access enabled"
  type        = bool
  default     = false
}

variable "document_check_function_storage_name" {
  description = "Function Storage name"
  type        = string
}

variable "document_check_function_storage_primary_access_key" {
  description = "Function Storage Primary Access Key"
  type        = string
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

variable "health_check_eviction_time_in_min" {
  description = "health check in mins"
  type        = number
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
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-south"
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

variable "primary_service_bus_namespace_id" {
  description = "The ID of the primary Service Bus Namespace"
  type        = string
}

variable "primary_sql_server_id" {
  description = "The ID of the primary Back Office SQL server"
  type        = string
}

variable "service_bus_failover_enabled" {
  default     = false
  description = "A switch to determine if Service Bus failover is enabled requiring the Premium SKU"
  type        = bool
}

variable "sql_server_azuread_administrator" {
  description = "A map describing the AzureAD account used for the SQL server administrator"
  type        = map(string)
}

variable "sql_server_password" {
  description = "The SQL server administrator password"
  sensitive   = true
  type        = string
}

variable "sql_server_username" {
  description = "The SQL server administrator username"
  sensitive   = true
  type        = string
}

variable "feature_service_bus_enabled" {
  description = "Whether or not Service Bus events are enabled"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_name" {
  description = "Document Storage document service uploads container name"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_resource_manager_id" {
  description = "Back Office document-service-uploads container resource_manager_id"
  type        = string
}

variable "document_storage_back_office_published_documents_container_resource_manager_id" {
  description = "Back Office published-documents container resource_manager_id"
  type        = string
}

variable "document_storage_submissions_container_resource_manager_id" {
  description = "Submissions container resource_manager_id"
  type        = string
}

variable "servicebus_topic_nsip_documents_id" {
  description = "Service Bus Topic nsip-document id"
  type        = string
}

variable "notify_subscribers_function_gov_notify_template_id" {
  description = "Notify Subscribers Function - GovNotify Template ID"
  type        = string
}

variable "notify_subscribers_function_gov_notify_template_welsh_id" {
  description = "Notify Subscribers Function - GovNotify Welsh Template ID"
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

variable "redis_cache_configuration" {
  description = "A map of redis configuration options"
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
