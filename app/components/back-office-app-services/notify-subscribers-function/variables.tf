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

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
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

variable "service_bus_namespace_name" {
  description = "The name of the Back Office service bus namespace"
  type        = string
}

variable "servicebus_topic_nsip_project_update_id" {
  description = "Service Bus Topic nsip-project-update id"
  type        = string
}

variable "gov_notify_api_key" {
  description = "GovNotify API Key"
  type        = string
}

variable "gov_notify_template_id" {
  description = "GovNotify Template ID"
  type        = string
}

variable "encrypt_key" {
  description = "Encrypt Key for Unsubscribe URLs"
  type        = string
}

variable "applications_front_office_web_url" {
  description = "Applications Front Office Web URL"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault so the Function App can pull secret values"
  type        = string
}
