variable "action_group_low_id" {
  description = "The ID of the Azure Monitor action group for low priority (P4) alerts"
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

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "common_resource_group_name" {
  description = "The common infrastructure resource group name"
  type        = string
}

variable "common_vnet_cidr_blocks" {
  description = "A map of IP address blocks from the subnet name to the allocated CIDR prefix"
  type        = map(string)
}

variable "common_vnet_name" {
  description = "The common infrastructure virtual network name"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry that hosts the image"
  type        = string
}

variable "container_registry_rg" {
  description = "The resource group of the container registry that hosts the image"
  type        = string
}

variable "database_size" {
  description = "A map of database sizing options"
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

variable "integration_subnet_id" {
  description = "The id of the vnet integration subnet the app service is linked to for egress traffic"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault so the App Service can pull secret values"
  type        = string
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
}

variable "monitoring_alerts_enabled" {
  default     = false
  description = "Indicates whether Azure Monitor alerts are enabled for App Service"
  type        = bool
}

variable "sql_server_administrator_password" {
  description = "The built-in SQL Server administrator password"
  sensitive   = true
  type        = string
}

variable "sql_server_administrator_username" {
  description = "The built-in SQL Server administrator password"
  sensitive   = true
  type        = string
}

variable "tooling_subscription_id" {
  description = "The ID for the Tooling subscription that houses the Container Registry"
  type        = string
}

variable "use_deployment_slots" {
  description = "Flag to indicate if App Service deployment slots are in use on the environment"
  type        = bool
  default     = true
}
