variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
  type        = string
}

variable "back_office_api_host" {
  description = "Back Office Api Host"
  type        = string
}

variable "function_apps_storage_account" {
  description = "Function Storage name"
  type        = string
}

variable "function_apps_storage_account_access_key" {
  description = "Function Storage Primary Access Key"
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

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID for Key Vault"
  type        = string
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "odw_subscription_id" {
  description = "Resource Group Name where ODW Synapse Workspace and Data Lake Storage Account live"
  type        = string
  default     = ""
}

variable "odw_resource_group_name" {
  description = "Resource Group Name where ODW Synapse Workspace and Data Lake Storage Account live"
  type        = string
  default     = ""
}

variable "odw_data_lake_storage_account_name" {
  description = "Storage Account Name for the ODW Data Lake"
  type        = string
  default     = ""
}

variable "odw_synapse_workspace_name" {
  description = "ODW Synapse Workspace Name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}
