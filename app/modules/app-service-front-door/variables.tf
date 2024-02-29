variable "app_service_url" {
  description = "Domain of the primary app service"
  type        = string
}

variable "common_log_analytics_workspace_id" {
  description = "The ID for the common Log Analytics Workspace"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "domain_name" {
  description = "Public domain name"
  type        = string
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

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}


variable "service_name" {
  description = "Public domain name"
  type        = string
}