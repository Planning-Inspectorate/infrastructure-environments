variable "alert_recipients" {
  description = "The email recipients for monitoring alerts"
  type        = map(list(string))
}

variable "app_service_plan_sku" {
  default     = "P2v2"
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "app_service_principal_id" {
  description = "The ID of the service principal associated with App Service in the tenant"
  type        = string
}

variable "common_tags" {
  description = "The common resource tags for the project"
  type        = map(string)
}

variable "cosmosdb_enable_public_access" {
  description = "A flag to indicate if the database can be accessed over the internet"
  type        = string
  default     = false
}

variable "environment" {
  description = "The environment resources are deployed to e.g. 'dev'"
  type        = string
}

variable "front_door_principal_id" {
  description = "The ID of the service principal associated with Front Door in the tenant"
  type        = string
}

variable "instance" {
  description = "The environment instance for use if multiple environments are deployed to a subscription"
  type        = string
  default     = "001"
}

variable "location" {
  description = "The location resources are deployed to in slug format e.g. 'uk-south'"
  type        = string
  default     = "uk-west"
}

variable "pipeline_appeals_service_principal_object_id" {
  description = "The ID of the service principal associated with the Appeals Service pipelines"
  type        = string
}

variable "pipeline_applications_service_principal_object_id" {
  description = "The ID of the service principal associated with the Applications Service pipelines"
  type        = string
}

variable "pipeline_back_office_principal_object_id" {
  description = "The ID of the service principal associated with the Back Office pipelines"
  type        = string
}

variable "primary_vnet_address_space" {
  description = "The CIDR address space for the common virtual network"
  type        = string
}

variable "tooling_network_name" {
  description = "The name of the VNet in the Tooling environment"
  type        = string
}

variable "tooling_network_region_short" {
  description = "The region in which the Tooling VNet resides in short format e.g. 'uks'"
  type        = string
}

variable "tooling_network_rg" {
  description = "The name of the resource group containing the VNet in the Tooling environment"
  type        = string
}

variable "create_turbrepo_cache" {
  description = "Whether or not to create the turborepo cache server. Should only be deployed to one environment."
  type        = bool
  default     = false
}
