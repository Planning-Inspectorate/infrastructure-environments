variable "back_office_appeals_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the back office appeals service"
  type        = string
  default     = "pins-wildcard-cert-2025-01-02"
}

variable "back_office_appeals_public_url" {
  description = "The public URL for the Back Office Appeals frontend web app"
  type        = string
}

variable "back_office_appeals_primary_app_service_url" {
  description = "The primary App Service URL for the Back Office Appeals"
  type        = string
}

variable "back_office_appeals_secondary_app_service_url" {
  description = "The secondary App Service URL for the Back Office Appeals"
  type        = string
  default     = ""
}

variable "common_log_analytics_workspace_id" {
  description = "The ID for the common Log Analytics Workspace"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "front_door_waf_mode" {
  description = "Indicates if the Web Application Firewall should be in Detection or Prevention mode"
  type        = string
  default     = "Detection"
}
variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-west'"
  type        = string
  default     = "uk-west"
}

variable "enable_search_indexing_by_default" {
  description = "A flag to indicate if the environment should enable search indexing for frontends by default"
  type        = bool
  default     = false
}

variable "feature_front_door_failover_enabled" {
  description = "Whether or not the backend pools should be created with both the primary and secondary app service urls. This feature flag is temporary."
  type        = bool
  default     = false

