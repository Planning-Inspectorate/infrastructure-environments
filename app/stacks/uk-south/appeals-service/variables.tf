variable "api_timeout" {
  description = "The timeout in milliseconds for API calls in the frontend apps"
  type        = string
}

variable "app_insights_connection_string" {
  description = "The connection string to connect to an Application Insights resource"
  sensitive   = true
  type        = string
}

variable "app_insights_instrumentation_key" {
  description = "The instrumentation key to connect to an Application Insights resource"
  sensitive   = true
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

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "cosmosdb_enable_public_access" {
  description = "A flag to indicate if the database can be accessed over the internet"
  type        = string
  default     = false
}

variable "cosmosdb_id" {
  description = "The ID of the CosmosDB account"
  type        = string
}

variable "cosmosdb_subnet_id" {
  description = "The ID of the subnet containing the Cosmos DB endpoint"
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

variable "google_analytics_id" {
  description = "The id used to connect the frontend app to Google Analytics"
  type        = string
}

variable "google_tag_manager_id" {
  description = "The id used to connect the frontend app to Google Tag Manager"
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

variable "key_vault_secret_refs" {
  description = "Map of secret references from the Key Vault"
  type        = map(string)
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

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "srv_notify_appeal_submission_confirmation_email_to_apellant_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_appeal_submission_received_notification_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_base_url" {
  description = "The base URL for the Notifications service"
  type        = string
}

variable "srv_notify_email_reply_to_id_start_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_service_id" {
  description = "The ID of the Notifications service"
  type        = string
}

variable "srv_notify_start_email_to_lpa_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "srv_notify_template_id" {
  description = "A template ID required by the Appeals Service API"
  type        = string
}

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
}
