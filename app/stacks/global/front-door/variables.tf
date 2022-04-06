variable "app_service_urls" {
  description = "A map of App Service service URLs"
  type        = map(string)
}

variable "appeals_service_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the appeals service"
  type        = string
  default     = null
}

variable "appeals_service_public_url" {
  description = "The public URL for the Appeals Service frontend web app"
  type        = string
}

variable "applications_service_ssl_certificate_name" {
  description = "The SSL certificate name in the environment Key Vault for the applications service"
  type        = string
  default     = null
}

variable "applications_service_public_url" {
  description = "The public URL for the Applications Service frontend web app"
  type        = string
}

variable "back_office_public_url" {
  description = "The public URL for the Back Office frontend web app"
  type        = string
}

variable "common_key_vault_id" {
  description = "The ID of the common environment Key Vault that contains SSL certificates"
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

variable "use_wildcard_certificate" {
  description = "A flag to indicate if Frontdoor should use the provisioned wildcard certificate"
  type        = bool
  default     = false
}
