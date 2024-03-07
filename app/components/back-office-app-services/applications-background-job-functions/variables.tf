variable "malware_scanning_topic_id" {
  description = "The ID of the Event Grid topic to listen on"
  type        = string
}

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

variable "back_office_api_host" {
  description = "Back Office Api Host"
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

variable "key_vault_uri" {
  description = "The URI of the Key Vault for api key access"
  type        = string
}

variable "servicebus_topic_nsip_documents_id" {
  description = "Service Bus topic nsip-document id"
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

variable "back_office_storage_account_host" {
  description = "Back Office Storage Account Hostname (e.g. https://pinsstdocsbodevukw001.blob.core.windows.net)"
  type        = string
}

variable "back_office_document_upload_container" {
  description = "Back Office Storage Container name for uploads"
  type        = string
  default     = "document-service-uploads"
}

variable "back_office_file_publish_container" {
  description = "Back Office Storage Container name for file publishing"
  type        = string
  default     = "published-documents"
}

variable "service_bus_namespace_name" {
  description = "The name of the Back Office service bus namespace"
  type        = string
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
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
