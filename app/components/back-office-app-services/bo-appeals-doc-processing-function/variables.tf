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

variable "service_bus_namespace_name" {
  description = "The name of the Back Office service bus namespace"
  type        = string
}

variable "bo_appeals_storage_account_name" {
  description = "Back Office Storage Account Hostname (e.g. https://pinsstdocsbodevukw001.blob.core.windows.net)"
  type        = string
}

variable "bo_appeals_document_container_id" {
  description = "Back Office Storage Container ID for documents"
  type        = string
  default     = "bo-appeals-documents"
}

variable "bo_appeals_document_container_name" {
  description = "Back Office Storage Container name for documents"
  type        = string
  default     = "bo-appeals-documents"
}

variable "malware_scanning_topic_id" {
  description = "The ID of the Event Grid topic to listen on for malware detection"
  type        = string
}

variable "service_bus_appeals_bo_document_copy_topic_id" {
  description = "ID of the appeals back office document copy Service Bus Topic"
  type        = string
}
