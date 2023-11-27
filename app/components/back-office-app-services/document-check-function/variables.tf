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

variable "clamav_host" {
  description = "The hostname of the ClamAV Container"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_resource_manager_id" {
  description = "Back Office document-service-uploads container resource_manager_id"
  type        = string
}

variable "back_office_documents_system_topic_name" {
  description = "Back Office Document Storage System Topic Name"
  type        = string
}

variable "document_storage_back_office_document_service_uploads_container_name" {
  description = "Document Storage document service uploads container name"
  type        = string
}

variable "service_bus_namespace_name" {
  description = "Name of Service Bus namespace"
  type        = string
}

variable "deadline_submissions_topic_name" {
  description = "Deadline Submissions Topic Name"
  type        = string
}

variable "document_storage_account_name" {
  description = "Document Storage Account name"
  type        = string
}
