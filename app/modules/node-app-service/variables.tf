variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority alerts"
  type        = string
}

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

variable "app_service_plan_resource_group_name" {
  description = "The App Service Plan resource group name required for custom hostname certificate placement"
  type        = string
  default     = null
}

variable "app_settings" {
  description = "The environment variables to be passed to the application"
  type        = map(string)
  default     = {}
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

variable "custom_hostname" {
  description = "The custom hostname applied to the App Service required for auth redirection with a reverse proxy"
  type        = string
  default     = null
}

variable "custom_hostname_certificate_secret_id" {
  description = "The Key Vault secret URL for the custom hostname SSL certificate"
  type        = string
  default     = null
}

variable "deployment_slot" {
  description = "Flag to indicate if the App Service should create a deployment slot"
  type        = bool
  default     = true
}

variable "endpoint_subnet_id" {
  default     = null
  description = "The id of the private endpoint subnet the app service is linked to for ingress traffic"
  type        = string
}

variable "front_door_restriction" {
  description = "Flag to indicate if the web app should be restricted so it can only be accessed via Front Door"
  nullable    = false
  type        = bool
  default     = false
}

variable "image_name" {
  description = "The name of the image deployed to the App Service"
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

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
  default     = null
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
  description = "The tags applied to all resources"
  type        = map(string)
}
