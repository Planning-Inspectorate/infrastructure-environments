variable "app_settings" {
  description = "The environment variables to be passed to the application"
  type        = map(string)
  default     = {}
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

variable "listen_port" {
  default     = 3310
  description = "The port on which the container will listen for requests"
  type        = number
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

variable "service_plan_sku" {
  default     = "P1v2"
  description = "The SKU of the App Service Plan providing resources to hosted App Services"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}
