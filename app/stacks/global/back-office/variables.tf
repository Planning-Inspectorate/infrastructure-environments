variable "appeals_back_office_service_name" {
  description = "The service name used for appeals back office"
  type        = string
  default     = "appeals-back-office"
}

variable "back_office_appeals_public_url" {
  description = "The public URL for the Back Office Appeals frontend web app"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

# variable "enable_search_indexing_by_default" {
#   description = "A flag to indicate if the environment should enable search indexing for frontends by default"
#   type        = bool
#   default     = false
# }

# variable "common_log_analytics_workspace_id" {
#   description = "The ID for the common Log Analytics Workspace"
#   type        = string
# }

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uksouth"
}

variable "published_documents_blob_storage_endpoint" {
  description = "Published documents blob endpoint"
  type        = string
}

variable "back_office_published_documents_domain" {
  description = "Domain for published documents"
  type        = string
}

variable "back_office_appeals_primary_app_service_url" {
  description = "The primary App Service URL for the Back Office Appeals"
  type        = string
}
