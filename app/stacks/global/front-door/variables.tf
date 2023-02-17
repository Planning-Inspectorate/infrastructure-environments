variable "appeals_service_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the appeals service"
  type        = string
  default     = "pins-wildcard"
}

variable "appeals_service_public_url" {
  description = "The public URL for the Appeals Service frontend web app"
  type        = string
}

variable "appeals_service_primary_app_service_url" {
  description = "The primary App Service URL for the Appeals Service"
  type        = string
}

variable "appeals_service_secondary_app_service_url" {
  description = "The secondary App Service URL for the Appeals Service"
  type        = string
  default     = ""
}

variable "applications_service_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the applications service"
  type        = string
  default     = "pins-wildcard"
}

variable "applications_service_public_url" {
  description = "The public URL for the Applications Service frontend web app"
  type        = string
}

variable "applications_service_primary_app_service_url" {
  description = "The primary App Service URL for the Applications Service"
  type        = string
}

variable "applications_service_secondary_app_service_url" {
  description = "The secondary App Service URL for the Applications Service"
  type        = string
  default     = ""
}

variable "back_office_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the back office service"
  type        = string
  default     = "pins-wildcard"
}

variable "back_office_public_url" {
  description = "The public URL for the Back Office frontend web app"
  type        = string
}

variable "back_office_primary_app_service_url" {
  description = "The primary App Service URL for the Back Office"
  type        = string
}

variable "back_office_secondary_app_service_url" {
  description = "The secondary App Service URL for the Back Office"
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

variable "feature_front_door_failover_enaled" {
  description = "Whether or not the backend pools should be created with both the primary and secondary app service urls. This feature flag is temporary."
  type        = bool
  default     = false
}
