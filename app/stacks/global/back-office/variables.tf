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
