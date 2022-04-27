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

variable "app_service_private_dns_zone_id" {
  description = "The id of the private DNS zone for App services"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "azuread_auth_case_officer_group_id" {
  description = "The Azure AD group ID for Back Office case officers"
  type        = string
  default     = null
}

variable "azuread_auth_client_id" {
  description = "The Back Office web frontend app registration ID used for Azure AD authentication"
  type        = string
  default     = null
}

variable "azuread_auth_inspector_group_id" {
  description = "The Azure AD group ID for Back Office inspectors"
  type        = string
  default     = null
}

variable "azuread_auth_validation_office_group_id" {
  description = "The Azure AD group ID for Back Office validation officers"
  type        = string
  default     = null
}

variable "container_registry_login_server" {
  description = "The URL used to connect to the Azure Container Registry"
  sensitive   = true
  type        = string
}

variable "container_registry_password" {
  description = "The password used to connect to the Azure Container Registry"
  sensitive   = true
  type        = string
}

variable "container_registry_username" {
  description = "The username used to connect to the Azure Container Registry"
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

variable "database_connection_string" {
  description = "The connection string used to connect to the MySQL database"
  sensitive   = true
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

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault"
  type        = string
}

variable "location" {
  description = "The location the App Services are deployed to in slug format e.g. 'uk-south'"
  type        = string
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "node_environment" {
  description = "The node environment to be used for applications in this environment e.g. development"
  type        = string
  default     = "development"
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the App Services"
  type        = string
}

variable "resource_suffix" {
  description = "The suffix for resource naming"
  type        = string
}

variable "service_name" {
  description = "The name of the service the Azure App Services are part of"
  type        = string
}

variable "tags" {
  description = "The tags applied to all resources"
  type        = map(string)
}

variable "use_deployment_slots" {
  description = "Flag to indicate if App Service deployment slots are in use on the environment"
  type        = bool
  default     = true
}
