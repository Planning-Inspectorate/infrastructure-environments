variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
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

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
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

variable "service_bus_namespace_name" {
  description = "The name of the Back Office service bus namespace"
  type        = string
}

variable "deadline_submissions_topic_name" {
  description = "Deadline Submissions Topic Name"
  type        = string
}

variable "back_office_api_host" {
  description = "Back Office Api Host"
  type        = string
}

variable "back_office_storage_account_host" {
  description = "Back Office Storage Account Hostname (e.g. https://pinsstdocsbodevukw001.blob.core.windows.net)"
  type        = string
}

variable "back_office_submissions_container" {
  description = "Back Office Storage Container name for submissions"
  type        = string
  default     = "application-submission-documents"
}

variable "back_office_document_upload_container" {
  description = "Back Office Storage Container name for uploads"
  type        = string
  default     = "document-service-uploads"
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "document_storage_submissions_container_resource_manager_id" {
  description = "Submissions container resource_manager_id"
  type        = string
}

variable "document_storage_uploads_container_resource_manager_id" {
  description = "Uploads container resource_manager_id"
  type        = string
}

variable "deadline_submission_subscription_id" {
  description = "Deadline submissions subscription id"
  type        = string
}
