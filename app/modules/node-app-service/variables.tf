variable "app_insights_connection_string" {
  description = "The connection string to connect to an Application Insights resource"
  sensitive   = true
  type        = string
}

variable "app_insights_instrumentation_key" {
  description = "The instrumentation key to connect to an Application Insights resource"
  sensitive   = true
  type        = string
}

variable "app_name" {
  description = "The name of the app service"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "app_settings" {
  description = "The environment variables to be passed to the application"
  type        = map(string)
}

variable "app_type" {
  description = "The type of application deployed to the App Service, valid values are 'backend' and 'frontend'"
  type        = string

  validation {
    condition     = contains(["backend", "frontend"], var.app_type)
    error_message = "Allowed values for app_type are 'backend' and 'frontend'."
  }
}

variable "container_image" {
  description = "The name of the image to be deployed to the app service"
  type        = string
}

variable "container_image_tag" {
  description = "The specific tag of the image to be deployed to the app service"
  type        = string
}

variable "container_registry_id" {
  description = "The id of the container registry that contains the image"
  type        = string
}

variable "container_registry_login_server" {
  description = "The URL that can be used to log into the container registry"
  type        = string
}

variable "endpoint_subnet_id" {
  description = "The id of the private endpoint subnet the app service is linked to for ingress traffic"
  type        = string
}

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "location" {
  description = "The name of the app service location"
  type        = string
}

variable "private_dns_zone_id" {
  default     = null
  description = "The id of the private dns zone, required if app_type is 'backend'"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "service_name" {
  description = "The name of the service the app belongs to"
  type        = string
}

variable "tags" {
  description = "The tags applied to the resource"
  type        = map(string)
}
