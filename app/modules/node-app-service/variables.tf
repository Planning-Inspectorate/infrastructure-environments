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

variable "app_service_private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  type        = string
  default     = null
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "app_settings" {
  description = "The environment variables to be passed to the application"
  type        = map(string)
}

variable "container_registry_login_server" {
  description = "The URL that can be used to log into the container registry"
  type        = string
}

variable "container_registry_server_password" {
  description = "The password used to connect to the container registry so that App Service can pull images"
  sensitive   = true
  type        = string
}

variable "container_registry_server_username" {
  description = "The username used to connect to the container registry so that App Service can pull images"
  sensitive   = true
  type        = string
}

variable "endpoint_subnet_id" {
  default     = null
  description = "The id of the private endpoint subnet the app service is linked to for ingress traffic"
  type        = string
}

variable "inbound_vnet_connectivity" {
  default     = false
  description = "Indicates whether inbound connectivity (Private Endpoint) is required"
  type        = bool
}

variable "integration_subnet_id" {
  default     = null
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "location" {
  description = "The name of the app service location"
  type        = string
}

variable "outbound_vnet_connectivity" {
  default     = false
  description = "Indicates whether outbound connectivity (VNET Integration) is required"
  type        = bool
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
